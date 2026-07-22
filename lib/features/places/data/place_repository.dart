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
        'createdAt': FieldValue.serverTimestamp(),
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
      createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }
}
