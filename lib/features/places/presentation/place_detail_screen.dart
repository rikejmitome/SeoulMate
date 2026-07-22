import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_theme.dart';
import '../../../shared/widgets/app_ui.dart';
import '../../auth/presentation/auth_providers.dart';
import '../../trip/presentation/trip_providers.dart';
import '../domain/place.dart';
import '../domain/place_vote.dart';
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
              child: _VoteSection(placeId: placeId, tripId: trip?.id),
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

class _VoteSection extends ConsumerWidget {
  const _VoteSection({required this.placeId, required this.tripId});

  final String placeId;
  final String? tripId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authRepositoryProvider).currentUser;
    final profile = ref.watch(userProfileProvider).asData?.value;
    final votes = ref.watch(activePlaceVotesProvider(placeId));
    if (tripId == null || user == null) {
      return const Text('Sign in to share your preference.');
    }

    return votes.when(
      loading: () => const Padding(
        padding: EdgeInsets.all(AppSpacing.sm),
        child: CircularProgressIndicator(),
      ),
      error: (_, __) => const AppErrorState(
        message: 'Votes are unavailable right now. Please try again.',
      ),
      data: (items) {
        final currentVote = items.cast<PlaceVote?>().firstWhere(
          (vote) => vote?.userId == user.uid,
          orElse: () => null,
        );
        final displayName = profile?.displayName.isNotEmpty == true
            ? profile!.displayName
            : user.displayName?.trim().isNotEmpty == true
            ? user.displayName!.trim()
            : user.email ?? 'Traveler';
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              currentVote == null
                  ? 'Choose how you feel about this place.'
                  : 'Your vote: ${currentVote.choice.label}. Tap it again to remove it.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: AppSpacing.md),
            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: VoteChoice.values
                  .map(
                    (choice) => ChoiceChip(
                      label: Text(choice.label),
                      selected: currentVote?.choice == choice,
                      onSelected: (_) => _changeVote(
                        context,
                        ref,
                        userId: user.uid,
                        displayName: displayName,
                        currentVote: currentVote,
                        nextChoice: choice,
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: AppSpacing.lg),
            _VoteGroups(votes: items),
          ],
        );
      },
    );
  }

  Future<void> _changeVote(
    BuildContext context,
    WidgetRef ref, {
    required String userId,
    required String displayName,
    required PlaceVote? currentVote,
    required VoteChoice nextChoice,
  }) async {
    try {
      final repository = ref.read(placeRepositoryProvider);
      if (currentVote?.choice == nextChoice) {
        await repository.removeVote(
          tripId: tripId!,
          placeId: placeId,
          userId: userId,
        );
      } else {
        await repository.saveVote(
          tripId: tripId!,
          placeId: placeId,
          vote: PlaceVote(
            userId: userId,
            displayName: displayName,
            choice: nextChoice,
            updatedAt: DateTime.now(),
          ),
        );
      }
    } catch (error) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not update your vote: $error')),
        );
      }
    }
  }
}

class _VoteGroups extends StatelessWidget {
  const _VoteGroups({required this.votes});

  final List<PlaceVote> votes;

  @override
  Widget build(BuildContext context) {
    final totals = PlaceVoting.totals(votes);
    return Column(
      children: VoteChoice.values
          .map(
            (choice) => _VoteGroup(
              choice: choice,
              votes: votes.where((vote) => vote.choice == choice).toList(),
              total: switch (choice) {
                VoteChoice.want => totals.want,
                VoteChoice.maybe => totals.maybe,
                VoteChoice.skip => totals.skip,
              },
            ),
          )
          .toList(),
    );
  }
}

class _VoteGroup extends StatelessWidget {
  const _VoteGroup({
    required this.choice,
    required this.votes,
    required this.total,
  });

  final VoteChoice choice;
  final List<PlaceVote> votes;
  final int total;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: AppSpacing.sm),
    child: Row(
      children: [
        SizedBox(width: 64, child: Text('${choice.label} $total')),
        Expanded(
          child: Wrap(
            spacing: AppSpacing.xs,
            runSpacing: AppSpacing.xs,
            children: votes
                .map(
                  (vote) => Tooltip(
                    message: vote.displayName,
                    child: CircleAvatar(
                      radius: 13,
                      backgroundColor: AppColors.surfaceVariant,
                      foregroundColor: AppColors.seoulBlue,
                      child: Text(_initials(vote.displayName)),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    ),
  );

  String _initials(String name) {
    final words = name
        .trim()
        .split(RegExp(r'\s+'))
        .where((word) => word.isNotEmpty);
    return words.take(2).map((word) => word[0].toUpperCase()).join();
  }
}
