import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_theme.dart';
import '../../../shared/widgets/app_primary_button.dart';
import 'auth_providers.dart';

class TemporaryHomeScreen extends ConsumerWidget {
  const TemporaryHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(userProfileProvider);
    final authRepository = ref.read(authRepositoryProvider);
    final fallbackName = authRepository.currentUser?.displayName ?? 'traveler';
    final profileName = profile.asData?.value?.displayName;

    return Scaffold(
      appBar: AppBar(title: const Text('SeoulMate')),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Welcome, ${profileName?.isNotEmpty == true ? profileName : fallbackName}',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: AppSpacing.md),
                      const Text(
                        'Your private SeoulMate account is connected and ready for the journey ahead.',
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      AppPrimaryButton(
                        label: 'Sign out',
                        onPressed: authRepository.signOut,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
