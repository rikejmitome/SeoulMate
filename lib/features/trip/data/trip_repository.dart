import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../domain/trip.dart';

class TripRepository {
  TripRepository(this._firestore);

  final FirebaseFirestore _firestore;

  CollectionReference<Map<String, dynamic>> get _trips =>
      _firestore.collection('trips');

  Stream<List<Trip>> watchTrips(String userId) {
    return _trips.where('memberIds', arrayContains: userId).snapshots().map((
      snapshot,
    ) {
      final trips = snapshot.docs
          .map((document) => _tripFromDocument(document))
          .toList();
      trips.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
      return trips;
    });
  }

  Stream<Trip?> watchTrip(String tripId) {
    return _trips.doc(tripId).snapshots().map((snapshot) {
      if (!snapshot.exists) {
        return null;
      }
      return _tripFromDocument(snapshot);
    });
  }

  Stream<List<TripMember>> watchMembers(String tripId) {
    return _trips.doc(tripId).collection('members').snapshots().map((snapshot) {
      final members = snapshot.docs
          .map((document) => _memberFromDocument(document))
          .toList();
      members.sort((a, b) => a.joinedAt.compareTo(b.joinedAt));
      return members;
    });
  }

  Future<void> createTrip({
    required TripDraft draft,
    required User owner,
  }) async {
    final trip = _trips.doc();
    final ownerName = owner.displayName?.trim().isNotEmpty == true
        ? owner.displayName!.trim()
        : owner.email ?? 'Traveler';
    final ownerEmail = owner.email ?? '';
    final batch = _firestore.batch();
    batch.set(trip, {
      'name': draft.name.trim(),
      'destination': draft.destination.trim(),
      'startDate': Timestamp.fromDate(draft.startDate),
      'endDate': Timestamp.fromDate(draft.endDate),
      'currency': draft.currency,
      'coverImageUrl': null,
      'ownerId': owner.uid,
      'memberIds': [owner.uid],
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
    });
    batch.set(trip.collection('members').doc(owner.uid), {
      'userId': owner.uid,
      'displayName': ownerName,
      'email': ownerEmail,
      'role': 'owner',
      'joinedAt': FieldValue.serverTimestamp(),
    });
    await batch.commit();
  }

  Future<void> updateTrip({required String tripId, required TripDraft draft}) {
    return _trips.doc(tripId).update({
      'name': draft.name.trim(),
      'destination': draft.destination.trim(),
      'startDate': Timestamp.fromDate(draft.startDate),
      'endDate': Timestamp.fromDate(draft.endDate),
      'currency': draft.currency,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  Future<void> deleteTrip(String tripId) async {
    final trip = _trips.doc(tripId);
    final members = await trip.collection('members').get();
    final batch = _firestore.batch();
    for (final member in members.docs) {
      batch.delete(member.reference);
    }
    batch.delete(trip);
    await batch.commit();
  }

  Future<void> inviteMember({
    required String tripId,
    required String email,
  }) async {
    final normalizedEmail = email.trim().toLowerCase();
    final match = await _firestore
        .collection('users')
        .where('email', isEqualTo: normalizedEmail)
        .limit(1)
        .get();
    if (match.docs.isEmpty) {
      throw const TripInviteException(
        'No SeoulMate account uses that email address yet.',
      );
    }
    final user = match.docs.single;
    final data = user.data();
    final member = _trips.doc(tripId).collection('members').doc(user.id);
    final batch = _firestore.batch();
    batch.set(member, {
      'userId': user.id,
      'displayName': data['displayName'] as String? ?? normalizedEmail,
      'email': data['email'] as String? ?? normalizedEmail,
      'role': 'member',
      'joinedAt': FieldValue.serverTimestamp(),
    });
    batch.update(_trips.doc(tripId), {
      'memberIds': FieldValue.arrayUnion([user.id]),
      'updatedAt': FieldValue.serverTimestamp(),
    });
    await batch.commit();
  }

  Future<void> removeMember({
    required String tripId,
    required String memberId,
  }) async {
    final batch = _firestore.batch();
    batch.delete(_trips.doc(tripId).collection('members').doc(memberId));
    batch.update(_trips.doc(tripId), {
      'memberIds': FieldValue.arrayRemove([memberId]),
      'updatedAt': FieldValue.serverTimestamp(),
    });
    await batch.commit();
  }

  Trip _tripFromDocument(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return Trip(
      id: document.id,
      name: data['name'] as String? ?? '',
      destination: data['destination'] as String? ?? '',
      startDate: (data['startDate'] as Timestamp?)?.toDate() ?? DateTime.now(),
      endDate: (data['endDate'] as Timestamp?)?.toDate() ?? DateTime.now(),
      currency: data['currency'] as String? ?? 'KRW',
      coverImageUrl: data['coverImageUrl'] as String?,
      ownerId: data['ownerId'] as String? ?? '',
      memberIds: List<String>.from(data['memberIds'] as List? ?? const []),
      createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      updatedAt: (data['updatedAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }

  TripMember _memberFromDocument(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    final data = document.data() ?? const <String, dynamic>{};
    return TripMember(
      userId: data['userId'] as String? ?? document.id,
      displayName: data['displayName'] as String? ?? '',
      email: data['email'] as String? ?? '',
      role: data['role'] as String? ?? 'member',
      joinedAt: (data['joinedAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }
}

class TripInviteException implements Exception {
  const TripInviteException(this.message);

  final String message;
}
