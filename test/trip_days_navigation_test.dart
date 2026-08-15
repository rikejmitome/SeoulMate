import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:seoulmate/core/theme/app_theme.dart';
import 'package:seoulmate/features/trip/domain/trip.dart';
import 'package:seoulmate/features/trip/presentation/trip_providers.dart';
import 'package:seoulmate/features/trip_days/domain/trip_day.dart';
import 'package:seoulmate/features/trip_days/presentation/trip_day_providers.dart';
import 'package:seoulmate/features/trip_days/presentation/trip_days_screen.dart';

void main() {
  final trip = Trip(
    id: 'trip-1',
    name: 'Seoul 2026',
    destination: 'Seoul',
    startDate: DateTime(2026, 10, 1),
    endDate: DateTime(2026, 10, 5),
    currency: 'KRW',
    ownerId: 'user-1',
    memberIds: const ['user-1'],
    createdAt: DateTime(2026, 1, 1),
    updatedAt: DateTime(2026, 1, 1),
  );

  testWidgets('Itinerary back action returns to the screen that opened it', (
    tester,
  ) async {
    await _setMobileViewport(tester);
    final router = GoRouter(
      initialLocation: '/home',
      routes: [
        GoRoute(
          path: '/home',
          builder: (context, state) => Scaffold(
            body: Center(
              child: FilledButton(
                onPressed: () => context.push('/trip/days'),
                child: const Text('Open itinerary'),
              ),
            ),
          ),
        ),
        GoRoute(
          path: '/trip/days',
          builder: (context, state) => const TripDaysScreen(),
        ),
      ],
    );
    addTearDown(router.dispose);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          tripsProvider.overrideWith((ref) => Stream.value([trip])),
          activeTripProvider.overrideWith((ref) => trip),
          activeTripDaysProvider.overrideWith(
            (ref) => Stream<List<TripDay>>.value(const []),
          ),
        ],
        child: MaterialApp.router(theme: buildAppTheme(), routerConfig: router),
      ),
    );
    await _pumpFrames(tester);

    await tester.tap(find.text('Open itinerary'));
    await _pumpFrames(tester);
    expect(find.text('Itinerary'), findsOneWidget);

    final backButton = find.byType(BackButton);
    expect(backButton, findsOneWidget);
    expect(tester.getSize(backButton).isEmpty, isFalse);

    await tester.tap(backButton);
    await _pumpFrames(tester);
    expect(tester.takeException(), isNull);
    expect(find.text('Open itinerary'), findsOneWidget);
  });

  testWidgets('Itinerary system back falls back to Home for a direct link', (
    tester,
  ) async {
    await _setMobileViewport(tester);
    final router = GoRouter(
      initialLocation: '/trip/days',
      routes: [
        GoRoute(
          path: '/home',
          builder: (context, state) =>
              const Scaffold(body: Center(child: Text('Open itinerary'))),
        ),
        GoRoute(
          path: '/trip/days',
          builder: (context, state) => const TripDaysScreen(),
        ),
      ],
    );
    addTearDown(router.dispose);

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          tripsProvider.overrideWith((ref) => Stream.value([trip])),
          activeTripProvider.overrideWith((ref) => trip),
          activeTripDaysProvider.overrideWith(
            (ref) => Stream<List<TripDay>>.value(const []),
          ),
        ],
        child: MaterialApp.router(theme: buildAppTheme(), routerConfig: router),
      ),
    );
    await _pumpFrames(tester);
    expect(find.text('Itinerary'), findsOneWidget);

    expect(find.byType(BackButton), findsOneWidget);
    expect(tester.getSize(find.byType(BackButton)).isEmpty, isFalse);

    await tester.binding.handlePopRoute();
    await _pumpFrames(tester);
    expect(tester.takeException(), isNull);
    expect(find.text('Open itinerary'), findsOneWidget);
  });
}

Future<void> _setMobileViewport(WidgetTester tester) async {
  tester.view.physicalSize = const Size(1080, 2400);
  tester.view.devicePixelRatio = 3;
  addTearDown(tester.view.reset);
}

Future<void> _pumpFrames(WidgetTester tester) async {
  await tester.pump();
  await tester.pump(const Duration(milliseconds: 300));
}
