import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../auth/presentation/auth_providers.dart';
import '../../trip/presentation/trip_providers.dart';
import '../data/trip_day_repository.dart';
import '../domain/trip_day.dart';

final tripDayRepositoryProvider = Provider<TripDayRepository>(
  (ref) => TripDayRepository(ref.watch(firestoreProvider)),
);

final activeTripDaysProvider = StreamProvider<List<TripDay>>((ref) {
  final trip = ref.watch(activeTripProvider);
  if (trip == null) return Stream.value(const []);
  return ref.watch(tripDayRepositoryProvider).watchDays(trip.id);
});

final activeTripDayProvider = StreamProvider.family<TripDay?, String>((
  ref,
  dayId,
) {
  final trip = ref.watch(activeTripProvider);
  if (trip == null) return Stream.value(null);
  return ref
      .watch(tripDayRepositoryProvider)
      .watchDay(tripId: trip.id, dayId: dayId);
});
