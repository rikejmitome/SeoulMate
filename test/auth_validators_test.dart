import 'package:flutter_test/flutter_test.dart';
import 'package:seoulmate/features/auth/domain/auth_validators.dart';

void main() {
  group('AuthValidators', () {
    test('requires a display name', () {
      expect(AuthValidators.displayName(''), isNotNull);
      expect(AuthValidators.displayName('Tomáš'), isNull);
    });

    test('validates email format', () {
      expect(AuthValidators.email('not-an-email'), isNotNull);
      expect(AuthValidators.email('traveler@example.com'), isNull);
    });

    test('requires matching passwords with at least eight characters', () {
      expect(AuthValidators.password('short'), isNotNull);
      expect(AuthValidators.password('seoulmate'), isNull);
      expect(
        AuthValidators.passwordConfirmation('different', 'seoulmate'),
        isNotNull,
      );
      expect(
        AuthValidators.passwordConfirmation('seoulmate', 'seoulmate'),
        isNull,
      );
    });
  });
}
