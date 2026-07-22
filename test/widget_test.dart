import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:seoulmate/core/routing/app_router.dart';
import 'package:seoulmate/main.dart';

void main() {
  testWidgets('renders the SeoulMate application shell', (tester) async {
    final router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) =>
              const Scaffold(body: Center(child: Text('SeoulMate'))),
        ),
      ],
    );
    addTearDown(router.dispose);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [appRouterProvider.overrideWithValue(router)],
        child: const SeoulMateApp(),
      ),
    );

    expect(find.text('SeoulMate'), findsOneWidget);
  });
}
