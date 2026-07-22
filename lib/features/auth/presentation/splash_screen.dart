import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_theme.dart';
import 'auth_providers.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);
    authState.whenData((user) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (context.mounted) {
          context.go(user == null ? '/login' : '/home');
        }
      });
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.location_city_outlined,
              color: AppColors.seoulBlue,
              size: AppSpacing.xxl,
            ),
            const SizedBox(height: AppSpacing.md),
            Text('SeoulMate', style: Theme.of(context).textTheme.displaySmall),
            const SizedBox(height: AppSpacing.lg),
            const CircularProgressIndicator(),
            if (authState.hasError) ...[
              const SizedBox(height: AppSpacing.md),
              Text(
                'SeoulMate is reconnecting…',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
