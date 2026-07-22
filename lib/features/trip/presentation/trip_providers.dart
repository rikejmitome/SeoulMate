import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../auth/presentation/auth_providers.dart';
import '../data/active_trip_store.dart';
import '../data/trip_repository.dart';
import '../domain/trip.dart';

final tripRepositoryProvider = Provider<TripRepository>((ref) {
  return TripRepository(ref.watch(firestoreProvider));
});

final tripsProvider = StreamProvider<List<Trip>>((ref) {
  final user = ref.watch(authStateProvider).asData?.value;
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

final activeTripStoreProvider = Provider<ActiveTripStore>(
  (ref) => ActiveTripStore(),
);

final selectedTripIdProvider =
    AsyncNotifierProvider<SelectedTripIdNotifier, String?>(
      SelectedTripIdNotifier.new,
    );

class SelectedTripIdNotifier extends AsyncNotifier<String?> {
  @override
  Future<String?> build() async {
    final user = ref.watch(authStateProvider).asData?.value;
    if (user == null) return null;

    ref.listen<AsyncValue<List<Trip>>>(tripsProvider, (_, next) {
      final trips = next.asData?.value;
      final selectedTripId = state.asData?.value;
      if (trips != null && state.hasValue) {
        _selectFallbackWhenNeeded(user.uid, trips, selectedTripId);
      }
    });

    final storedTripId = await ref.read(activeTripStoreProvider).read(user.uid);
    final trips = ref.read(tripsProvider).asData?.value;
    final resolvedTripId = _resolvedTripId(storedTripId, trips);
    if (resolvedTripId != storedTripId) {
      await ref
          .read(activeTripStoreProvider)
          .write(userId: user.uid, tripId: resolvedTripId);
    }
    return resolvedTripId;
  }

  Future<void> selectTrip(String? tripId) async {
    final user = ref.read(authStateProvider).asData?.value;
    if (user == null) return;
    state = AsyncData(tripId);
    await ref
        .read(activeTripStoreProvider)
        .write(userId: user.uid, tripId: tripId);
  }

  void _selectFallbackWhenNeeded(
    String userId,
    List<Trip> trips,
    String? selectedTripId,
  ) {
    final resolvedTripId = _resolvedTripId(selectedTripId, trips);
    if (resolvedTripId == selectedTripId) return;
    state = AsyncData(resolvedTripId);
    ref
        .read(activeTripStoreProvider)
        .write(userId: userId, tripId: resolvedTripId);
  }

  String? _resolvedTripId(String? selectedTripId, List<Trip>? trips) {
    if (trips == null) return selectedTripId;
    if (trips.isEmpty) return null;
    for (final trip in trips) {
      if (trip.id == selectedTripId) return selectedTripId;
    }
    return trips.first.id;
  }
}

final activeTripProvider = Provider<Trip?>((ref) {
  final trips = ref.watch(tripsProvider).asData?.value;
  final selectedTripId = ref.watch(selectedTripIdProvider).asData?.value;
  if (trips == null || selectedTripId == null) return null;
  for (final trip in trips) {
    if (trip.id == selectedTripId) {
      return trip;
    }
  }
  return null;
});
