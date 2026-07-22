import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../auth/presentation/auth_providers.dart';
import '../../trip/presentation/trip_providers.dart';
import '../data/place_repository.dart';
import '../domain/place.dart';

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
