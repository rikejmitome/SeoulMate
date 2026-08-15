import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/auth_providers.dart';
import '../../features/auth/presentation/forgot_password_screen.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/auth/presentation/register_screen.dart';
import '../../features/auth/presentation/splash_screen.dart';
import '../../features/home/presentation/home_screen.dart';
import '../../features/places/presentation/create_place_screen.dart';
import '../../features/places/presentation/edit_place_screen.dart';
import '../../features/places/presentation/place_detail_screen.dart';
import '../../features/places/presentation/places_screen.dart';
import '../../features/trip/presentation/trip_detail_screen.dart';
import '../../features/trip/presentation/trip_form_screen.dart';
import '../../features/trip/presentation/trip_members_screen.dart';
import '../../features/trip/presentation/trips_screen.dart';
import '../../features/trip_days/presentation/trip_day_detail_screen.dart';
import '../../features/trip_days/presentation/trip_day_form_screen.dart';
import '../../features/trip_days/presentation/trip_days_screen.dart';
import '../../shared/widgets/context_screen.dart';
import 'app_shell.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final auth = ref.watch(authStateNotifierProvider);
  final router = GoRouter(
    initialLocation: '/splash',
    refreshListenable: auth,
    redirect: (_, state) {
      final location = state.matchedLocation;
      final public =
          location == '/splash' ||
          location == '/login' ||
          location == '/register' ||
          location == '/forgot-password';
      if (!auth.isAuthenticated && !public) return '/login';
      if (auth.isAuthenticated &&
          (location == '/login' ||
              location == '/register' ||
              location == '/forgot-password')) {
        return '/home';
      }
      return null;
    },
    routes: [
      GoRoute(path: '/splash', builder: (_, __) => const SplashScreen()),
      GoRoute(path: '/login', builder: (_, __) => const LoginScreen()),
      GoRoute(path: '/register', builder: (_, __) => const RegisterScreen()),
      GoRoute(
        path: '/forgot-password',
        builder: (_, __) => const ForgotPasswordScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (_, __, shell) => AppShell(navigationShell: shell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(path: '/home', builder: (_, __) => const HomeScreen()),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(path: '/trips', builder: (_, __) => const TripsScreen()),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/places',
                builder: (_, __) => const PlacesScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/budget',
                builder: (_, __) => const ContextScreen(
                  title: 'Budget',
                  icon: Icons.account_balance_wallet_outlined,
                  message:
                      'A clear view of shared travel spending belongs here.',
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/more',
                builder: (_, __) => const ContextScreen(
                  title: 'More',
                  icon: Icons.more_horiz,
                  message:
                      'Your Korean companion, documents and travel essentials live here.',
                ),
              ),
            ],
          ),
        ],
      ),
      GoRoute(path: '/trip/new', builder: (_, __) => const TripFormScreen()),
      GoRoute(path: '/trip/days', builder: (_, __) => const TripDaysScreen()),
      GoRoute(
        path: '/trip/days/new',
        builder: (_, __) => const TripDayFormScreen(),
      ),
      GoRoute(
        path: '/trip/days/:id',
        builder: (_, state) =>
            TripDayDetailScreen(dayId: state.pathParameters['id']!),
      ),
      GoRoute(
        path: '/trip/days/:id/edit',
        builder: (_, state) =>
            TripDayFormScreen(dayId: state.pathParameters['id']!),
      ),
      GoRoute(
        path: '/places/create',
        builder: (_, __) => const CreatePlaceScreen(),
      ),
      GoRoute(
        path: '/places/:id',
        builder: (_, state) =>
            PlaceDetailScreen(placeId: state.pathParameters['id']!),
      ),
      GoRoute(
        path: '/places/:id/edit',
        builder: (_, state) =>
            EditPlaceScreen(placeId: state.pathParameters['id']!),
      ),
      GoRoute(
        path: '/trip/:id',
        builder: (_, state) =>
            TripDetailScreen(tripId: state.pathParameters['id']!),
      ),
      GoRoute(
        path: '/trip/:id/edit',
        builder: (_, state) =>
            TripFormScreen(tripId: state.pathParameters['id']!),
      ),
      GoRoute(
        path: '/trip/:id/members',
        builder: (_, state) =>
            TripMembersScreen(tripId: state.pathParameters['id']!),
      ),
    ],
  );
  ref.onDispose(router.dispose);
  return router;
});
