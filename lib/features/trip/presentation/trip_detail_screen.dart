import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_theme.dart';
import '../../auth/presentation/auth_providers.dart';
import 'trip_providers.dart';

class TripDetailScreen extends ConsumerWidget {
  const TripDetailScreen({required this.tripId, super.key});
  final String tripId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trip = ref.watch(tripProvider(tripId));
    final userId = ref.read(authRepositoryProvider).currentUser?.uid;
    return trip.when(
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (_, __) => const Scaffold(
        body: Center(child: Text('SeoulMate cannot open this trip right now.')),
      ),
      data: (item) {
        if (item == null)
          return const Scaffold(
            body: Center(child: Text('This trip is no longer available.')),
          );
        final isOwner = item.ownerId == userId;
        return Scaffold(
          appBar: AppBar(
            title: Text(item.name),
            actions: isOwner
                ? [
                    IconButton(
                      onPressed: () => context.push('/trip/$tripId/edit'),
                      icon: const Icon(Icons.edit_outlined),
                    ),
                    IconButton(
                      onPressed: () => context.push('/trip/$tripId/members'),
                      icon: const Icon(Icons.group_outlined),
                    ),
                  ]
                : null,
          ),
          body: ListView(
            padding: const EdgeInsets.all(AppSpacing.lg),
            children: [
              Text(
                item.destination,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                '${item.startDate.day}.${item.startDate.month}.${item.startDate.year} – ${item.endDate.day}.${item.endDate.month}.${item.endDate.year} · ${item.currency}',
              ),
              const SizedBox(height: AppSpacing.xl),
              Container(
                height: AppSpacing.xxl,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.surfaceVariant,
                  borderRadius: BorderRadius.circular(AppRadius.standard),
                ),
                child: const Text('Your shared Korea cover will live here.'),
              ),
              if (isOwner) ...[
                const SizedBox(height: AppSpacing.xl),
                OutlinedButton.icon(
                  onPressed: () async {
                    final okay = await showDialog<bool>(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Delete trip?'),
                        content: const Text(
                          'This removes the shared trip and its members.',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context, false),
                            child: const Text('Keep trip'),
                          ),
                          FilledButton(
                            onPressed: () => Navigator.pop(context, true),
                            child: const Text('Delete'),
                          ),
                        ],
                      ),
                    );
                    if (okay == true) {
                      try {
                        await ref
                            .read(tripRepositoryProvider)
                            .deleteTrip(tripId);
                        if (context.mounted) context.go('/trips');
                      } catch (error) {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Could not delete trip: $error'),
                            ),
                          );
                        }
                      }
                    }
                  },
                  icon: const Icon(Icons.delete_outline),
                  label: const Text('Delete trip'),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
