import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/auth_repository.dart';
import '../data/profile_repository.dart';
import '../domain/user_profile.dart';

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
});

final firestoreProvider = Provider<FirebaseFirestore>((ref) {
  return FirebaseFirestore.instance;
});

final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  return ProfileRepository(ref.watch(firestoreProvider));
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(
    ref.watch(firebaseAuthProvider),
    ref.watch(profileRepositoryProvider),
  );
});

final authStateProvider = StreamProvider<User?>((ref) {
  return ref.watch(authRepositoryProvider).authStateChanges();
});

final userProfileProvider = StreamProvider<UserProfile?>((ref) {
  final user = ref.watch(authRepositoryProvider).currentUser;
  if (user == null) {
    return Stream.value(null);
  }
  return ref.watch(profileRepositoryProvider).watchProfile(user.uid);
});

final authStateNotifierProvider = Provider<AuthStateNotifier>((ref) {
  final notifier = AuthStateNotifier(ref.watch(authRepositoryProvider));
  ref.onDispose(notifier.dispose);
  return notifier;
});

class AuthStateNotifier extends ChangeNotifier {
  AuthStateNotifier(this._repository) {
    _subscription = _repository.authStateChanges().listen((_) {
      notifyListeners();
    });
  }

  final AuthRepository _repository;
  late final StreamSubscription<User?> _subscription;

  bool get isAuthenticated => _repository.currentUser != null;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
