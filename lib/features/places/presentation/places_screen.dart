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

class PlacesScreen extends ConsumerStatefulWidget {
  const PlacesScreen({super.key});

  @override
  ConsumerState<PlacesScreen> createState() => _PlacesScreenState();
}

class _PlacesScreenState extends ConsumerState<PlacesScreen> {
  static const _categories = [
    'All',
    'Restaurant',
    'Café',
    'Culture',
    'Shopping',
    'Nature',
    'Nightlife',
    'Experience',
    'Hidden gem',
  ];

  String _category = 'All';
  String _status = 'All';
  _PlaceSort _sort = _PlaceSort.recent;

  @override
  Widget build(BuildContext context) {
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
              onPressed: () => _openCreate(context),
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
                _PlaceFilters(
                  category: _category,
                  status: _status,
                  sort: _sort,
                  onCategoryChanged: (value) =>
                      setState(() => _category = value),
                  onStatusChanged: (value) => setState(() => _status = value),
                  onSortChanged: (value) => setState(() => _sort = value),
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
                    data: (items) {
                      final filtered = _filterAndSort(items);
                      if (items.isEmpty) {
                        return AppEmptyState(
                          icon: Icons.place_outlined,
                          title: 'Your map is ready',
                          message:
                              'Save the restaurants, cafés and discoveries you do not want to miss.',
                          action: AppPrimaryButton(
                            label: 'Add your first place',
                            onPressed: () => _openCreate(context),
                          ),
                        );
                      }
                      if (filtered.isEmpty) {
                        return const AppEmptyState(
                          icon: Icons.filter_alt_off_outlined,
                          title: 'No matching places',
                          message: 'Try a different category or visit status.',
                        );
                      }
                      return ListView.separated(
                        padding: const EdgeInsets.fromLTRB(
                          AppSpacing.lg,
                          AppSpacing.md,
                          AppSpacing.lg,
                          AppSpacing.xxl,
                        ),
                        itemCount: filtered.length,
                        separatorBuilder: (_, __) =>
                            const SizedBox(height: AppSpacing.sm),
                        itemBuilder: (context, index) => _PlaceCard(
                          place: filtered[index],
                          onTap: () =>
                              context.push('/places/${filtered[index].id}'),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }

  List<Place> _filterAndSort(List<Place> places) {
    final result = places
        .where(
          (place) =>
              (_category == 'All' || place.category == _category) &&
              (_status == 'All' || place.status == _status),
        )
        .toList();
    switch (_sort) {
      case _PlaceSort.recent:
        result.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      case _PlaceSort.name:
        result.sort(
          (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()),
        );
      case _PlaceSort.status:
        result.sort((a, b) => a.status.compareTo(b.status));
    }
    return result;
  }

  Future<void> _openCreate(BuildContext context) async {
    final saved = await context.push<bool>('/places/create');
    if (saved == true && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Place saved to the selected trip.')),
      );
    }
  }
}

class _PlaceFilters extends StatelessWidget {
  const _PlaceFilters({
    required this.category,
    required this.status,
    required this.sort,
    required this.onCategoryChanged,
    required this.onStatusChanged,
    required this.onSortChanged,
  });

  final String category;
  final String status;
  final _PlaceSort sort;
  final ValueChanged<String> onCategoryChanged;
  final ValueChanged<String> onStatusChanged;
  final ValueChanged<_PlaceSort> onSortChanged;

  @override
  Widget build(BuildContext context) => Column(
    children: [
      SizedBox(
        height: 40,
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          children: _PlacesScreenState._categories
              .map(
                (value) => Padding(
                  padding: const EdgeInsets.only(right: AppSpacing.sm),
                  child: ChoiceChip(
                    label: Text(value),
                    selected: category == value,
                    onSelected: (_) => onCategoryChanged(value),
                  ),
                ),
              )
              .toList(),
        ),
      ),
      const SizedBox(height: AppSpacing.sm),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
        child: Row(
          children: [
            ChoiceChip(
              label: const Text('All'),
              selected: status == 'All',
              onSelected: (_) => onStatusChanged('All'),
            ),
            const SizedBox(width: AppSpacing.sm),
            ChoiceChip(
              label: const Text('Planned'),
              selected: status == 'planned',
              onSelected: (_) => onStatusChanged('planned'),
            ),
            const SizedBox(width: AppSpacing.sm),
            ChoiceChip(
              label: const Text('Visited'),
              selected: status == 'visited',
              onSelected: (_) => onStatusChanged('visited'),
            ),
            const Spacer(),
            PopupMenuButton<_PlaceSort>(
              tooltip: 'Sort places',
              initialValue: sort,
              onSelected: onSortChanged,
              itemBuilder: (_) => const [
                PopupMenuItem(
                  value: _PlaceSort.recent,
                  child: Text('Recently added'),
                ),
                PopupMenuItem(value: _PlaceSort.name, child: Text('Name')),
                PopupMenuItem(
                  value: _PlaceSort.status,
                  child: Text('Visit status'),
                ),
              ],
              child: const Padding(
                padding: EdgeInsets.all(AppSpacing.sm),
                child: Icon(Icons.sort),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

enum _PlaceSort { recent, name, status }

class _PlaceCard extends StatelessWidget {
  const _PlaceCard({required this.place, required this.onTap});

  final Place place;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => AppCard(
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.standard),
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
          const Icon(Icons.chevron_right),
        ],
      ),
    ),
  );
}
