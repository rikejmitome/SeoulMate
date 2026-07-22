abstract final class AuthValidators {
  static String? displayName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Enter the name your travel friends know you by.';
    }
    return null;
  }

  static String? email(String? value) {
    final email = value?.trim() ?? '';
    if (email.isEmpty) {
      return 'Enter your email address.';
    }
    if (!email.contains('@')) {
      return 'Enter a valid email address.';
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.length < 8) {
      return 'Use at least 8 characters.';
    }
    return null;
  }

  static String? passwordConfirmation(String? value, String password) {
    if (value != password) {
      return 'Passwords do not match.';
    }
    return null;
  }
}
