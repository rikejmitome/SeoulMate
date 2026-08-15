import 'package:cloud_firestore/cloud_firestore.dart';

import '../domain/trip_day.dart';
import '../domain/trip_day_rules.dart';

class TripDayRepository {
  TripDayRepository(this._firestore);

  final FirebaseFirestore _firestore;

  Stream<List<TripDay>> watchDays(String tripId) => _days(tripId)
      .snapshots()
      .map((snapshot) => snapshot.docs.map(_fromDocument).toList())
      .map((days) {
        days.sort((a, b) {
          final order = a.order.compareTo(b.order);
          return order != 0 ? order : a.date.compareTo(b.date);
        });
        return days;
      });

  Stream<TripDay?> watchDay({required String tripId, required String dayId}) =>
      _days(tripId)
          .doc(dayId)
          .snapshots()
          .map((document) => document.exists ? _fromDocument(document) : null);

  Future<void> createDay({
    required String tripId,
    required TripDayDraft draft,
    required List<TripDay> existingDays,
  }) async {
    final date = TripDayRules.dateOnly(draft.date);
    final dayId = TripDayRules.dateKey(date);
    final document = _days(tripId).doc(dayId);
    final existing = await document.get();
    if (existing.exists) {
      throw const TripDayDuplicateException(
        'A day already exists for this date.',
      );
    }
    final preservesChronology = TripDayRules.usesChronologicalOrder(
      existingDays,
    );
    final insertedDay = TripDay(
      id: dayId,
      tripId: tripId,
      date: date,
      title: draft.title,
      summary: draft.summary,
      order: 0,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    final allDays = [...existingDays, insertedDay]
      ..sort((a, b) => a.date.compareTo(b.date));
    final order = preservesChronology
        ? allDays.indexWhere((day) => day.id == dayId)
        : existingDays.isEmpty
        ? 0
        : existingDays.map((day) => day.order).reduce((a, b) => a > b ? a : b) +
              1;
    final batch = _firestore.batch();
    batch.set(document, _dayData(tripId: tripId, draft: draft, order: order));
    if (preservesChronology) {
      for (var index = 0; index < allDays.length; index++) {
        final day = allDays[index];
        if (day.id != dayId && day.order != index) {
          batch.update(_days(tripId).doc(day.id), {
            'order': index,
            'updatedAt': FieldValue.serverTimestamp(),
          });
        }
      }
    }
    await batch.commit();
  }

  Future<int> generateMissingDays({
    required String tripId,
    required List<TripDay> existingDays,
    required List<DateTime> missingDates,
  }) async {
    if (missingDates.isEmpty) return 0;
    final datesToCreate = <DateTime>[];
    for (final date in missingDates) {
      final normalized = TripDayRules.dateOnly(date);
      final existing = await _days(
        tripId,
      ).doc(TripDayRules.dateKey(normalized)).get();
      if (!existing.exists) datesToCreate.add(normalized);
    }
    if (datesToCreate.isEmpty) return 0;
    final batch = _firestore.batch();
    final preservesChronology = TripDayRules.usesChronologicalOrder(
      existingDays,
    );
    final generatedDays = datesToCreate
        .map(
          (date) => TripDay(
            id: TripDayRules.dateKey(date),
            tripId: tripId,
            date: date,
            title: '',
            summary: '',
            order: 0,
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
          ),
        )
        .toList();
    final allDays = [...existingDays, ...generatedDays]
      ..sort((a, b) => a.date.compareTo(b.date));
    var nextOrder = existingDays.isEmpty
        ? 0
        : existingDays.map((day) => day.order).reduce((a, b) => a > b ? a : b) +
              1;
    for (final normalized in datesToCreate) {
      final document = _days(tripId).doc(TripDayRules.dateKey(normalized));
      final order = preservesChronology
          ? allDays.indexWhere(
              (day) => day.id == TripDayRules.dateKey(normalized),
            )
          : nextOrder;
      batch.set(
        document,
        _dayData(
          tripId: tripId,
          draft: TripDayDraft(
            date: normalized,
            title: 'Day ${order + 1}',
            summary: '',
          ),
          order: order,
        ),
      );
      nextOrder++;
    }
    if (preservesChronology) {
      for (var index = 0; index < allDays.length; index++) {
        final day = allDays[index];
        if (!generatedDays.any((generated) => generated.id == day.id) &&
            day.order != index) {
          batch.update(_days(tripId).doc(day.id), {
            'order': index,
            'updatedAt': FieldValue.serverTimestamp(),
          });
        }
      }
    }
    await batch.commit();
    return datesToCreate.length;
  }

  Future<void> updateDay({
    required String tripId,
    required TripDay currentDay,
    required TripDayDraft draft,
    required List<TripDay> existingDays,
  }) async {
    final date = TripDayRules.dateOnly(draft.date);
    final nextId = TripDayRules.dateKey(date);
    final source = _days(tripId).doc(currentDay.id);
    final destination = _days(tripId).doc(nextId);
    final preservesChronology = TripDayRules.usesChronologicalOrder(
      existingDays,
    );
    final updatedDay = currentDay.copyWith(id: nextId, date: date);
    final allDays = [
      for (final day in existingDays)
        if (day.id != currentDay.id) day,
      updatedDay,
    ]..sort((a, b) => a.date.compareTo(b.date));
    final nextOrder = preservesChronology
        ? allDays.indexWhere((day) => day.id == nextId)
        : currentDay.order;
    if (nextId != currentDay.id) {
      final existing = await destination.get();
      if (existing.exists) {
        throw const TripDayDuplicateException(
          'A day already exists for this date.',
        );
      }
      final batch = _firestore.batch();
      batch.set(
        destination,
        _dayData(
          tripId: tripId,
          draft: draft,
          order: nextOrder,
          createdAt: currentDay.createdAt,
        ),
      );
      batch.delete(source);
      if (preservesChronology) {
        _writeChronologicalOrderUpdates(
          batch: batch,
          tripId: tripId,
          days: allDays,
          excludedDayId: nextId,
        );
      }
      await batch.commit();
      return;
    }
    final batch = _firestore.batch();
    batch.update(source, {
      'title': draft.title.trim(),
      'summary': draft.summary.trim(),
      'date': Timestamp.fromDate(date),
      'dateKey': nextId,
      'order': nextOrder,
      'updatedAt': FieldValue.serverTimestamp(),
    });
    if (preservesChronology) {
      _writeChronologicalOrderUpdates(
        batch: batch,
        tripId: tripId,
        days: allDays,
        excludedDayId: currentDay.id,
      );
    }
    await batch.commit();
  }

  Future<void> deleteDay({
    required String tripId,
    required String dayId,
  }) async {
    final days = _days(tripId);
    final snapshot = await days.get();
    final remaining =
        snapshot.docs.where((document) => document.id != dayId).toList()..sort(
          (a, b) => ((a.data()['order'] as int?) ?? 0).compareTo(
            (b.data()['order'] as int?) ?? 0,
          ),
        );
    final batch = _firestore.batch();
    batch.delete(days.doc(dayId));
    for (var index = 0; index < remaining.length; index++) {
      batch.update(remaining[index].reference, {
        'order': index,
        'updatedAt': FieldValue.serverTimestamp(),
      });
    }
    await batch.commit();
  }

  Future<void> reorderDays({
    required String tripId,
    required List<TripDay> orderedDays,
  }) async {
    final batch = _firestore.batch();
    for (var index = 0; index < orderedDays.length; index++) {
      batch.update(_days(tripId).doc(orderedDays[index].id), {
        'order': index,
        'updatedAt': FieldValue.serverTimestamp(),
      });
    }
    await batch.commit();
  }

  CollectionReference<Map<String, dynamic>> _days(String tripId) =>
      _firestore.collection(TripDayPath.collection(tripId));

  void _writeChronologicalOrderUpdates({
    required WriteBatch batch,
    required String tripId,
    required List<TripDay> days,
    required String excludedDayId,
  }) {
    for (var index = 0; index < days.length; index++) {
      final day = days[index];
      if (day.id != excludedDayId && day.order != index) {
        batch.update(_days(tripId).doc(day.id), {
          'order': index,
          'updatedAt': FieldValue.serverTimestamp(),
        });
      }
    }
  }

  Map<String, dynamic> _dayData({
    required String tripId,
    required TripDayDraft draft,
    required int order,
    DateTime? createdAt,
  }) {
    final date = TripDayRules.dateOnly(draft.date);
    return {
      'tripId': tripId,
      'date': Timestamp.fromDate(date),
      'dateKey': TripDayRules.dateKey(date),
      'title': draft.title.trim(),
      'summary': draft.summary.trim(),
      'order': order,
      'createdAt': createdAt == null
          ? FieldValue.serverTimestamp()
          : Timestamp.fromDate(createdAt),
      'updatedAt': FieldValue.serverTimestamp(),
    };
  }

  TripDay _fromDocument(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return TripDay(
      id: document.id,
      tripId: data['tripId'] as String? ?? '',
      date: (data['date'] as Timestamp?)?.toDate() ?? DateTime.now(),
      title: data['title'] as String? ?? '',
      summary: data['summary'] as String? ?? '',
      order: data['order'] as int? ?? 0,
      createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      updatedAt: (data['updatedAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }
}

class TripDayDuplicateException implements Exception {
  const TripDayDuplicateException(this.message);

  final String message;
}
