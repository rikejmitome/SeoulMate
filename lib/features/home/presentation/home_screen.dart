import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_theme.dart';
import '../../../features/auth/presentation/auth_providers.dart';
import '../../../features/trip/presentation/trip_providers.dart';
import '../../../features/trip/presentation/widgets/trip_card.dart';
import '../../../features/trip/presentation/widgets/trip_selector.dart';
import '../../../shared/widgets/app_primary_button.dart';
import '../../../shared/widgets/app_ui.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(userProfileProvider).asData?.value;
    final activeTrip = ref.watch(activeTripProvider);
    final name = profile?.displayName.isNotEmpty == true
        ? profile!.displayName
        : 'traveler';
    return Scaffold(
      appBar: AppBar(title: const Text('SeoulMate')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          children: [
            Text(
              'Annyeong, $name',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              'Your shared Korea story starts here.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: AppSpacing.xl),
            if (activeTrip == null)
              AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.map_outlined, color: AppColors.haechiGold),
                    const SizedBox(height: AppSpacing.md),
                    Text(
                      'Your Korean adventure starts here.',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    const Text(
                      'Create your first trip and give every plan, place and memory a home.',
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    AppPrimaryButton(
                      label: 'Create your first trip',
                      onPressed: () => context.push('/trip/new'),
                    ),
                  ],
                ),
              )
            else ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Your trip',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const TripSelector(compact: true),
                ],
              ),
              const SizedBox(height: AppSpacing.md),
              TripCard(
                trip: activeTrip,
                isActive: true,
                onTap: () => context.push('/trip/${activeTrip.id}'),
              ),
              const SizedBox(height: AppSpacing.lg),
              AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Itinerary',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    const Text(
                      'Shape each day of your selected trip before the adventure begins.',
                    ),
                    const SizedBox(height: AppSpacing.md),
                    OutlinedButton.icon(
                      onPressed: () => context.push('/trip/days'),
                      icon: const Icon(Icons.calendar_month_outlined),
                      label: const Text('Manage trip days'),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
