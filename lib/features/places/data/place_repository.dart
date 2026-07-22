import 'package:cloud_firestore/cloud_firestore.dart';

import '../domain/place.dart';

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
        'votes': place.votes,
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

  Future<void> setVote({
    required String tripId,
    required String placeId,
    required String userId,
    required String preference,
  }) => _db
      .collection('trips')
      .doc(tripId)
      .collection('places')
      .doc(placeId)
      .update({
        'votes.$userId': preference,
        'updatedAt': FieldValue.serverTimestamp(),
      });

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
      votes: Map<String, String>.from(data['votes'] as Map? ?? const {}),
      createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }
}
