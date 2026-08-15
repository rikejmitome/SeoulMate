import 'package:flutter_test/flutter_test.dart';
import 'package:seoulmate/features/trip/domain/trip.dart';
import 'package:seoulmate/features/trip_days/domain/trip_day.dart';
import 'package:seoulmate/features/trip_days/domain/trip_day_rules.dart';

void main() {
  final trip = Trip(
    id: 'trip-a',
    name: 'Korea',
    destination: 'Seoul',
    startDate: DateTime(2026, 10, 1),
    endDate: DateTime(2026, 10, 5),
    currency: 'KRW',
    ownerId: 'owner',
    memberIds: const ['owner'],
    createdAt: DateTime(2026),
    updatedAt: DateTime(2026),
  );

  TripDay day(String id, DateTime date, int order) => TripDay(
    id: id,
    tripId: trip.id,
    date: date,
    title: 'Day $order',
    summary: '',
    order: order,
    createdAt: DateTime(2026),
    updatedAt: DateTime(2026),
  );

  group('TripDayRules', () {
    test('generates dates inclusively from trip start through end', () {
      final dates = TripDayRules.inclusiveDates(trip.startDate, trip.endDate);

      expect(dates, hasLength(5));
      expect(dates.first, DateTime(2026, 10, 1));
      expect(dates.last, DateTime(2026, 10, 5));
    });

    test('finds only missing dates and prevents duplicate dates', () {
      final existing = [day('2026-10-01', DateTime(2026, 10, 1), 0)];

      expect(
        TripDayRules.validateUniqueDate(
          existingDays: existing,
          date: DateTime(2026, 10, 1),
        ),
        isNotNull,
      );
      expect(
        TripDayRules.missingDates(trip: trip, existingDays: existing),
        hasLength(4),
      );
    });

    test('validates dates are within the trip range', () {
      expect(
        TripDayRules.validateDate(trip: trip, date: DateTime(2026, 9, 30)),
        isNotNull,
      );
      expect(
        TripDayRules.validateDate(trip: trip, date: DateTime(2026, 10, 3)),
        isNull,
      );
    });

    test('orders new days chronologically by default', () {
      final ordered = TripDayRules.chronological([
        day('third', DateTime(2026, 10, 3), 2),
        day('first', DateTime(2026, 10, 1), 0),
      ]);

      expect(ordered.map((item) => item.id), ['first', 'third']);
      expect(TripDayRules.usesChronologicalOrder(ordered), isTrue);
    });

    test('applies a persisted custom order without changing dates', () {
      final original = [
        day('first', DateTime(2026, 10, 1), 0),
        day('second', DateTime(2026, 10, 2), 1),
      ];
      final reordered = TripDayRules.applyOrder(original, ['second', 'first']);

      expect(reordered.map((item) => item.order), [0, 1]);
      expect(reordered.first.date, DateTime(2026, 10, 2));
      expect(reordered.last.date, DateTime(2026, 10, 1));
    });

    test('removes only the requested day', () {
      final remaining = TripDayRules.removeDay([
        day('first', DateTime(2026, 10, 1), 0),
        day('second', DateTime(2026, 10, 2), 1),
      ], 'first');

      expect(remaining.map((item) => item.id), ['second']);
    });

    test('keeps day collections isolated by trip', () {
      expect(TripDayPath.collection('trip-a'), 'trips/trip-a/days');
      expect(
        TripDayPath.collection('trip-a'),
        isNot(TripDayPath.collection('trip-b')),
      );
    });
  });
}
