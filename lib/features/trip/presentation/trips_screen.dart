import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_theme.dart';
import 'trip_providers.dart';
import 'widgets/trip_card.dart';
import 'widgets/trip_selector.dart';
import '../../../shared/widgets/app_ui.dart';

class TripsScreen extends ConsumerWidget {
  const TripsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trips = ref.watch(tripsProvider);
    final activeTripId = ref.watch(activeTripProvider)?.id;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trips'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: TripSelector(compact: true),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/trip/new'),
        icon: const Icon(Icons.add),
        label: const Text('Create trip'),
      ),
      body: trips.when(
        loading: () => const AppLoadingState(label: 'Finding your journeys…'),
        error: (_, __) => const AppErrorState(
          message:
              'Your trips are unavailable right now. Please check your connection and try again.',
        ),
        data: (items) => items.isEmpty
            ? _TripMessage(
                icon: Icons.luggage_outlined,
                title: 'No trips yet',
                message: 'Your next Korean adventure is waiting to be created.',
              )
            : ListView.separated(
                padding: const EdgeInsets.all(AppSpacing.lg),
                itemCount: items.length,
                separatorBuilder: (_, __) =>
                    const SizedBox(height: AppSpacing.sm),
                itemBuilder: (context, index) => TripCard(
                  trip: items[index],
                  isActive: items[index].id == activeTripId,
                  onTap: () => ref
                      .read(selectedTripIdProvider.notifier)
                      .selectTrip(items[index].id),
                  onViewDetails: () => context.push('/trip/${items[index].id}'),
                ),
              ),
      ),
    );
  }
}

class _TripMessage extends StatelessWidget {
  const _TripMessage({
    required this.icon,
    required this.title,
    required this.message,
  });

  final IconData icon;
  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: AppSpacing.xxl, color: AppColors.seoulBlue),
            const SizedBox(height: AppSpacing.md),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              message,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
