import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_theme.dart';
import '../../../shared/widgets/app_ui.dart';
import '../../auth/presentation/auth_providers.dart';
import '../../trip/presentation/trip_providers.dart';
import '../domain/place.dart';
import 'place_providers.dart';

class PlaceDetailScreen extends ConsumerWidget {
  const PlaceDetailScreen({required this.placeId, super.key});

  final String placeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final place = ref.watch(activePlaceProvider(placeId));
    return place.when(
      loading: () =>
          const Scaffold(body: AppLoadingState(label: 'Opening place…')),
      error: (_, __) => const Scaffold(
        body: AppErrorState(message: 'This place could not be opened.'),
      ),
      data: (item) {
        if (item == null) {
          return const Scaffold(
            body: AppEmptyState(
              icon: Icons.location_off_outlined,
              title: 'Place unavailable',
              message: 'It is no longer part of the selected trip.',
            ),
          );
        }
        return _PlaceDetail(place: item, placeId: placeId);
      },
    );
  }
}

class _PlaceDetail extends ConsumerWidget {
  const _PlaceDetail({required this.place, required this.placeId});

  final Place place;
  final String placeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trip = ref.watch(activeTripProvider);
    final userId = ref.watch(authRepositoryProvider).currentUser?.uid;
    return Scaffold(
      appBar: AppBar(
        title: Text(place.name),
        actions: [
          IconButton(
            tooltip: 'Edit place',
            onPressed: () => _edit(context),
            icon: const Icon(Icons.edit_outlined),
          ),
          IconButton(
            tooltip: 'Delete place',
            onPressed: () => _delete(context, ref, trip?.id),
            icon: const Icon(Icons.delete_outline),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          children: [
            Text(place.name, style: Theme.of(context).textTheme.displaySmall),
            if (place.koreanName.isNotEmpty) ...[
              const SizedBox(height: AppSpacing.xs),
              Text(
                place.koreanName,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
            const SizedBox(height: AppSpacing.md),
            Wrap(
              spacing: AppSpacing.sm,
              children: [
                Chip(label: Text(place.category)),
                Chip(
                  label: Text(
                    place.status == 'visited' ? 'Visited' : 'Planned',
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
            _DetailSection(title: 'Location', child: Text(place.address)),
            if (place.notes.isNotEmpty) ...[
              const SizedBox(height: AppSpacing.lg),
              _DetailSection(title: 'Notes', child: Text(place.notes)),
            ],
            if (_mapLinks(place).isNotEmpty) ...[
              const SizedBox(height: AppSpacing.lg),
              _DetailSection(
                title: 'Map links',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _mapLinks(place)
                      .map(
                        (link) => Padding(
                          padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                          child: SelectableText(link),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
            const SizedBox(height: AppSpacing.lg),
            _DetailSection(
              title: 'Group decision',
              child: _VoteControls(
                place: place,
                tripId: trip?.id,
                userId: userId,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<String> _mapLinks(Place value) => [
    value.googleMapsUrl,
    value.naverMapsUrl,
    value.kakaoMapsUrl,
  ].where((link) => link.isNotEmpty).toList();

  Future<void> _delete(
    BuildContext context,
    WidgetRef ref,
    String? tripId,
  ) async {
    if (tripId == null) return;
    final confirmed = await showAppConfirmation(
      context,
      title: 'Delete place?',
      message:
          'This removes ${place.name} from the selected trip for everyone.',
      confirmLabel: 'Delete',
    );
    if (!confirmed || !context.mounted) return;
    try {
      await ref
          .read(placeRepositoryProvider)
          .delete(tripId: tripId, placeId: placeId);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Place removed from this trip.')),
        );
        context.pop();
      }
    } catch (error) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not delete place: $error')),
        );
      }
    }
  }

  Future<void> _edit(BuildContext context) async {
    final saved = await context.push<bool>('/places/$placeId/edit');
    if (saved == true && context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Place changes saved.')));
    }
  }
}

class _DetailSection extends StatelessWidget {
  const _DetailSection({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) => AppCard(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: AppSpacing.sm),
        child,
      ],
    ),
  );
}

class _VoteControls extends ConsumerWidget {
  const _VoteControls({
    required this.place,
    required this.tripId,
    required this.userId,
  });

  final Place place;
  final String? tripId;
  final String? userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (tripId == null || userId == null) {
      return const Text('Sign in to share your preference.');
    }
    final currentVote = place.votes[userId];
    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      children: [
        _VoteChip(
          label: 'Want',
          selected: currentVote == 'want',
          onSelected: () => _setVote(ref, tripId!, userId!, 'want'),
        ),
        _VoteChip(
          label: 'Maybe',
          selected: currentVote == 'maybe',
          onSelected: () => _setVote(ref, tripId!, userId!, 'maybe'),
        ),
        _VoteChip(
          label: 'Skip',
          selected: currentVote == 'skip',
          onSelected: () => _setVote(ref, tripId!, userId!, 'skip'),
        ),
      ],
    );
  }

  Future<void> _setVote(
    WidgetRef ref,
    String tripId,
    String userId,
    String preference,
  ) => ref
      .read(placeRepositoryProvider)
      .setVote(
        tripId: tripId,
        placeId: place.id,
        userId: userId,
        preference: preference,
      );
}

class _VoteChip extends StatelessWidget {
  const _VoteChip({
    required this.label,
    required this.selected,
    required this.onSelected,
  });

  final String label;
  final bool selected;
  final VoidCallback onSelected;

  @override
  Widget build(BuildContext context) => ChoiceChip(
    label: Text(label),
    selected: selected,
    onSelected: (_) => onSelected(),
  );
}
