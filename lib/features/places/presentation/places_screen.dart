import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_theme.dart';
import '../../../shared/widgets/app_primary_button.dart';
import '../../../shared/widgets/app_ui.dart';
import '../../trip/presentation/trip_providers.dart';
import '../../trip/presentation/widgets/trip_selector.dart';
import '../domain/place.dart';
import 'place_providers.dart';

class PlacesScreen extends ConsumerWidget {
  const PlacesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeTrip = ref.watch(activeTripProvider);
    final places = ref.watch(activePlacesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Places'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: TripSelector(compact: true),
          ),
        ],
      ),
      floatingActionButton: activeTrip == null
          ? null
          : FloatingActionButton.extended(
              onPressed: () => context.push('/places/create'),
              icon: const Icon(Icons.add),
              label: const Text('Add place'),
            ),
      body: activeTrip == null
          ? const AppEmptyState(
              icon: Icons.luggage_outlined,
              title: 'Choose a trip first',
              message:
                  'Create a trip before you start collecting the places you want to visit.',
            )
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    AppSpacing.lg,
                    AppSpacing.md,
                    AppSpacing.lg,
                    AppSpacing.sm,
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.flight_takeoff_outlined,
                        color: AppColors.seoulBlue,
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      Expanded(
                        child: Text(
                          'Places for ${activeTrip.name}',
                          style: Theme.of(context).textTheme.titleLarge,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: places.when(
                    loading: () => const AppLoadingState(
                      label: 'Finding your saved places…',
                    ),
                    error: (_, __) => AppErrorState(
                      message:
                          'We could not load your places. Please check your connection and try again.',
                      onRetry: () => ref.invalidate(activePlacesProvider),
                    ),
                    data: (items) => items.isEmpty
                        ? AppEmptyState(
                            icon: Icons.place_outlined,
                            title: 'Your map is ready',
                            message:
                                'Save the restaurants, cafés and discoveries you do not want to miss.',
                            action: AppPrimaryButton(
                              label: 'Add your first place',
                              onPressed: () => context.push('/places/create'),
                            ),
                          )
                        : ListView.separated(
                            padding: const EdgeInsets.all(AppSpacing.lg),
                            itemCount: items.length,
                            separatorBuilder: (_, __) =>
                                const SizedBox(height: AppSpacing.sm),
                            itemBuilder: (context, index) =>
                                _PlaceCard(place: items[index]),
                          ),
                  ),
                ),
              ],
            ),
    );
  }
}

class _PlaceCard extends StatelessWidget {
  const _PlaceCard({required this.place});

  final Place place;

  @override
  Widget build(BuildContext context) => AppCard(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(AppSpacing.sm),
          decoration: const BoxDecoration(
            color: AppColors.surfaceVariant,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.place_outlined, color: AppColors.seoulBlue),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(place.name, style: Theme.of(context).textTheme.titleLarge),
              if (place.koreanName.isNotEmpty) ...[
                const SizedBox(height: AppSpacing.xs),
                Text(
                  place.koreanName,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
              const SizedBox(height: AppSpacing.sm),
              Wrap(
                spacing: AppSpacing.sm,
                runSpacing: AppSpacing.xs,
                children: [
                  Chip(label: Text(place.category)),
                  Chip(
                    label: Text(
                      place.status == 'visited' ? 'Visited' : 'Planned',
                    ),
                  ),
                ],
              ),
              if (place.address.isNotEmpty) ...[
                const SizedBox(height: AppSpacing.sm),
                Text(
                  place.address,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ],
          ),
        ),
      ],
    ),
  );
}
