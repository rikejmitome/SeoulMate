import 'package:firebase_auth/firebase_auth.dart';

import 'profile_repository.dart';

class AuthRepository {
  AuthRepository(this._auth, this._profileRepository);

  final FirebaseAuth _auth;
  final ProfileRepository _profileRepository;

  Stream<User?> authStateChanges() => _auth.authStateChanges();

  User? get currentUser => _auth.currentUser;

  Future<void> register({
    required String displayName,
    required String email,
    required String password,
  }) async {
    final credential = await _auth.createUserWithEmailAndPassword(
      email: email.trim(),
      password: password,
    );
    final user = credential.user;
    if (user == null) {
      throw StateError('SeoulMate could not create your account.');
    }

    await user.updateDisplayName(displayName.trim());
    await _profileRepository.createProfile(
      userId: user.uid,
      displayName: displayName,
      email: email,
    );
  }

  Future<void> signIn({required String email, required String password}) async {
    final credential = await _auth.signInWithEmailAndPassword(
      email: email.trim(),
      password: password,
    );
    final user = credential.user;
    if (user != null) {
      await _profileRepository.touchProfile(user.uid);
    }
  }

  Future<void> sendPasswordResetEmail(String email) {
    return _auth.sendPasswordResetEmail(email: email.trim());
  }

  Future<void> signOut() => _auth.signOut();
}
