import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../auth/presentation/auth_providers.dart';
import '../../trip/presentation/trip_providers.dart';
import '../data/place_repository.dart';
import '../domain/place.dart';
import '../domain/place_vote.dart';

final placeRepositoryProvider = Provider<PlaceRepository>(
  (ref) => PlaceRepository(ref.watch(firestoreProvider)),
);

final activePlacesProvider = StreamProvider<List<Place>>((ref) {
  final trip = ref.watch(activeTripProvider);
  if (trip == null) return Stream.value(const []);
  return ref.watch(placeRepositoryProvider).watch(trip.id);
});

final activePlaceProvider = StreamProvider.family<Place?, String>((
  ref,
  placeId,
) {
  final trip = ref.watch(activeTripProvider);
  if (trip == null) return Stream.value(null);
  return ref
      .watch(placeRepositoryProvider)
      .watchPlace(tripId: trip.id, placeId: placeId);
});

final activePlaceVotesProvider = StreamProvider.family<List<PlaceVote>, String>(
  (ref, placeId) {
    final trip = ref.watch(activeTripProvider);
    if (trip == null) return Stream.value(const []);
    return ref
        .watch(placeRepositoryProvider)
        .watchVotes(tripId: trip.id, placeId: placeId);
  },
);
