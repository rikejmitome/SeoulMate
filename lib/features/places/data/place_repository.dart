import 'package:cloud_firestore/cloud_firestore.dart';

import '../domain/place.dart';
import '../domain/place_vote.dart';

class PlaceRepository {
  PlaceRepository(this._db);

  final FirebaseFirestore _db;

  Stream<List<Place>> watch(String tripId) => _db
      .collection('trips')
      .doc(tripId)
      .collection('places')
      .snapshots()
      .map(
        (snapshot) => snapshot.docs
            .map((document) => _placeFromDocument(document))
            .toList(),
      );

  Future<void> create({required String tripId, required Place place}) =>
      _db.collection('trips').doc(tripId).collection('places').add({
        'name': place.name,
        'koreanName': place.koreanName,
        'category': place.category,
        'address': place.address,
        'googleMapsUrl': place.googleMapsUrl,
        'naverMapsUrl': place.naverMapsUrl,
        'kakaoMapsUrl': place.kakaoMapsUrl,
        'notes': place.notes,
        'status': place.status,
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      });

  Stream<Place?> watchPlace({
    required String tripId,
    required String placeId,
  }) => _db
      .collection('trips')
      .doc(tripId)
      .collection('places')
      .doc(placeId)
      .snapshots()
      .map((document) => document.exists ? _placeFromDocument(document) : null);

  Future<void> update({required String tripId, required Place place}) => _db
      .collection('trips')
      .doc(tripId)
      .collection('places')
      .doc(place.id)
      .update({
        'name': place.name,
        'koreanName': place.koreanName,
        'category': place.category,
        'address': place.address,
        'googleMapsUrl': place.googleMapsUrl,
        'naverMapsUrl': place.naverMapsUrl,
        'kakaoMapsUrl': place.kakaoMapsUrl,
        'notes': place.notes,
        'status': place.status,
        'updatedAt': FieldValue.serverTimestamp(),
      });

  Future<void> delete({required String tripId, required String placeId}) => _db
      .collection('trips')
      .doc(tripId)
      .collection('places')
      .doc(placeId)
      .delete();

  Stream<List<PlaceVote>> watchVotes({
    required String tripId,
    required String placeId,
  }) => _votes(tripId: tripId, placeId: placeId).snapshots().map(
    (snapshot) => snapshot.docs.map(_voteFromDocument).toList(),
  );

  Future<void> saveVote({
    required String tripId,
    required String placeId,
    required PlaceVote vote,
  }) => _votes(tripId: tripId, placeId: placeId).doc(vote.userId).set({
    'userId': vote.userId,
    'displayName': vote.displayName,
    'choice': vote.choice.name,
    'updatedAt': FieldValue.serverTimestamp(),
  });

  Future<void> removeVote({
    required String tripId,
    required String placeId,
    required String userId,
  }) => _votes(tripId: tripId, placeId: placeId).doc(userId).delete();

  CollectionReference<Map<String, dynamic>> _votes({
    required String tripId,
    required String placeId,
  }) => _db.collection(
    PlaceVotePath.collection(tripId: tripId, placeId: placeId),
  );

  Place _placeFromDocument(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return Place(
      id: document.id,
      name: data['name'] as String? ?? '',
      koreanName: data['koreanName'] as String? ?? '',
      category: data['category'] as String? ?? '',
      address: data['address'] as String? ?? '',
      googleMapsUrl: data['googleMapsUrl'] as String? ?? '',
      naverMapsUrl: data['naverMapsUrl'] as String? ?? '',
      kakaoMapsUrl: data['kakaoMapsUrl'] as String? ?? '',
      notes: data['notes'] as String? ?? '',
      status: data['status'] as String? ?? 'planned',
      createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }

  PlaceVote _voteFromDocument(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return PlaceVote(
      userId: data['userId'] as String? ?? document.id,
      displayName: data['displayName'] as String? ?? 'Traveler',
      choice: VoteChoice.values.firstWhere(
        (choice) => choice.name == data['choice'],
        orElse: () => VoteChoice.maybe,
      ),
      updatedAt: (data['updatedAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }
}
