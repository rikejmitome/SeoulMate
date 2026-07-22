import 'package:firebase_auth/firebase_auth.dart';

String authErrorMessage(Object error) {
  if (error is FirebaseAuthException) {
    return switch (error.code) {
      'email-already-in-use' => 'This email already has a SeoulMate account.',
      'invalid-email' => 'Enter a valid email address.',
      'weak-password' =>
        'Choose a stronger password with at least 8 characters.',
      'user-not-found' ||
      'wrong-password' ||
      'invalid-credential' => 'Your email or password is not correct.',
      'network-request-failed' =>
        'SeoulMate cannot connect right now. Please try again.',
      _ => 'Something went wrong. Please try again.',
    };
  }
  return 'Something went wrong. Please try again.';
}
