import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/auth_providers.dart';
import '../../features/auth/presentation/forgot_password_screen.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/auth/presentation/register_screen.dart';
import '../../features/auth/presentation/splash_screen.dart';
import '../../features/auth/presentation/temporary_home_screen.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final authNotifier = ref.watch(authStateNotifierProvider);
  final router = GoRouter(
    initialLocation: '/splash',
    refreshListenable: authNotifier,
    redirect: (context, state) {
      final location = state.matchedLocation;
      final isSplash = location == '/splash';
      final isAuthenticationRoute =
          location == '/login' ||
          location == '/register' ||
          location == '/forgot-password';

      if (isSplash) {
        return null;
      }
      if (!authNotifier.isAuthenticated && !isAuthenticationRoute) {
        return '/login';
      }
      if (authNotifier.isAuthenticated && isAuthenticationRoute) {
        return '/home';
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/forgot-password',
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const TemporaryHomeScreen(),
      ),
    ],
  );
  ref.onDispose(router.dispose);
  return router;
});
