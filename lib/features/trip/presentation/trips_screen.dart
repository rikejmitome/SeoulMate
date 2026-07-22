import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_theme.dart';
import 'trip_providers.dart';
import 'widgets/trip_card.dart';

class TripsScreen extends ConsumerWidget {
  const TripsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trips = ref.watch(tripsProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Trips')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/trip/new'),
        icon: const Icon(Icons.add),
        label: const Text('Create trip'),
      ),
      body: trips.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => _TripMessage(
          icon: Icons.cloud_off_outlined,
          title: 'Your trips are unavailable right now.',
          message: 'Please check your connection and try again.',
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
                  onTap: () => context.push('/trip/${items[index].id}'),
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
