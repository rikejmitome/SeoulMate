import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../auth/presentation/auth_providers.dart';
import '../data/trip_repository.dart';
import '../domain/trip.dart';

final tripRepositoryProvider = Provider<TripRepository>((ref) {
  return TripRepository(ref.watch(firestoreProvider));
});

final tripsProvider = StreamProvider<List<Trip>>((ref) {
  final user = ref.watch(authRepositoryProvider).currentUser;
  if (user == null) {
    return Stream.value(const []);
  }
  return ref.watch(tripRepositoryProvider).watchTrips(user.uid);
});

final tripProvider = StreamProvider.family<Trip?, String>((ref, tripId) {
  return ref.watch(tripRepositoryProvider).watchTrip(tripId);
});

final tripMembersProvider = StreamProvider.family<List<TripMember>, String>(
  (ref, tripId) => ref.watch(tripRepositoryProvider).watchMembers(tripId),
);

final activeTripProvider = Provider<Trip?>((ref) {
  final trips = ref.watch(tripsProvider).asData?.value ?? const [];
  final today = DateTime.now();
  for (final trip in trips) {
    if (!today.isBefore(trip.startDate) && !today.isAfter(trip.endDate)) {
      return trip;
    }
  }
  return trips.isEmpty ? null : trips.first;
});
