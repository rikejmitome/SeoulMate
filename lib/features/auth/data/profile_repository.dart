import 'package:cloud_firestore/cloud_firestore.dart';

import '../domain/user_profile.dart';

class ProfileRepository {
  ProfileRepository(this._firestore);

  final FirebaseFirestore _firestore;

  CollectionReference<Map<String, dynamic>> get _users =>
      _firestore.collection('users');

  Stream<UserProfile?> watchProfile(String userId) {
    return _users.doc(userId).snapshots().map((snapshot) {
      final data = snapshot.data();
      if (!snapshot.exists || data == null) {
        return null;
      }
      return _profileFromDocument(snapshot.id, data);
    });
  }

  Future<void> createProfile({
    required String userId,
    required String displayName,
    required String email,
  }) {
    return _users.doc(userId).set({
      'displayName': displayName.trim(),
      'email': email.trim(),
      'photoUrl': null,
      'createdAt': FieldValue.serverTimestamp(),
      'lastActiveAt': FieldValue.serverTimestamp(),
    });
  }

  Future<void> touchProfile(String userId) {
    return _users.doc(userId).set({
      'lastActiveAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }

  UserProfile _profileFromDocument(String id, Map<String, dynamic> data) {
    final createdAt = data['createdAt'] as Timestamp?;
    final lastActiveAt = data['lastActiveAt'] as Timestamp?;
    return UserProfile(
      id: id,
      displayName: data['displayName'] as String? ?? '',
      email: data['email'] as String? ?? '',
      photoUrl: data['photoUrl'] as String?,
      createdAt: createdAt?.toDate() ?? DateTime.now(),
      lastActiveAt: lastActiveAt?.toDate(),
    );
  }
}
