import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Firestore rules restrict vote writes to the authenticated voter', () {
    final rules = File('firestore.rules').readAsStringSync();

    expect(rules, contains('match /votes/{userId}'));
    expect(rules, contains('request.auth.uid == userId'));
    expect(rules, contains('request.resource.data.userId == request.auth.uid'));
    expect(
      rules,
      contains("request.resource.data.choice in ['want', 'maybe', 'skip']"),
    );
  });
}
