import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'Firestore rules limit day access to members and immutable parent trip',
    () {
      final rules = File('firestore.rules').readAsStringSync();

      expect(rules, contains('match /days/{dayId}'));
      expect(rules, contains('request.resource.data.tripId == tripId'));
      expect(
        rules,
        contains('request.resource.data.tripId == resource.data.tripId'),
      );
      expect(
        rules,
        contains(
          r'request.auth.uid in get(/databases/$(database)/documents/trips/$(tripId)).data.memberIds',
        ),
      );
    },
  );
}
