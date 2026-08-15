import '../../trip/domain/trip.dart';
import 'trip_day.dart';

abstract final class TripDayRules {
  static DateTime dateOnly(DateTime value) =>
      DateTime(value.year, value.month, value.day);

  static String dateKey(DateTime value) {
    final date = dateOnly(value);
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    return '${date.year}-$month-$day';
  }

  static List<DateTime> inclusiveDates(DateTime start, DateTime end) {
    final first = dateOnly(start);
    final last = dateOnly(end);
    if (last.isBefore(first)) return const [];
    return [
      for (
        var date = first;
        !date.isAfter(last);
        date = date.add(const Duration(days: 1))
      )
        date,
    ];
  }

  static String? validateDate({required Trip trip, required DateTime date}) {
    final normalized = dateOnly(date);
    if (normalized.isBefore(dateOnly(trip.startDate)) ||
        normalized.isAfter(dateOnly(trip.endDate))) {
      return 'Choose a date within ${dateKey(trip.startDate)} to ${dateKey(trip.endDate)}.';
    }
    return null;
  }

  static String? validateUniqueDate({
    required Iterable<TripDay> existingDays,
    required DateTime date,
    String? excludingDayId,
  }) {
    final key = dateKey(date);
    for (final day in existingDays) {
      if (day.id != excludingDayId && dateKey(day.date) == key) {
        return 'A day already exists for $key.';
      }
    }
    return null;
  }

  static List<DateTime> missingDates({
    required Trip trip,
    required Iterable<TripDay> existingDays,
  }) {
    final existing = existingDays.map((day) => dateKey(day.date)).toSet();
    return inclusiveDates(
      trip.startDate,
      trip.endDate,
    ).where((date) => !existing.contains(dateKey(date))).toList();
  }

  static List<TripDay> chronological(List<TripDay> days) {
    final sorted = [...days];
    sorted.sort((a, b) => a.date.compareTo(b.date));
    return sorted;
  }

  static bool usesChronologicalOrder(List<TripDay> days) {
    final byOrder = [...days]..sort((a, b) => a.order.compareTo(b.order));
    final byDate = chronological(days);
    if (byOrder.length != byDate.length) return false;
    for (var index = 0; index < byOrder.length; index++) {
      if (byOrder[index].id != byDate[index].id) return false;
    }
    return true;
  }

  static List<TripDay> applyOrder(List<TripDay> days, List<String> ids) {
    final byId = {for (final day in days) day.id: day};
    return [
      for (var index = 0; index < ids.length; index++)
        if (byId[ids[index]] != null) byId[ids[index]]!.copyWith(order: index),
    ];
  }

  static List<TripDay> removeDay(List<TripDay> days, String dayId) =>
      days.where((day) => day.id != dayId).toList();
}

abstract final class TripDayPath {
  static String collection(String tripId) => 'trips/$tripId/days';
}
