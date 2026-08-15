import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_theme.dart';
import '../../../shared/widgets/app_primary_button.dart';
import '../../../shared/widgets/app_ui.dart';
import '../../trip/presentation/trip_providers.dart';
import '../../trip/presentation/widgets/trip_selector.dart';
import '../../trip/domain/trip.dart';
import '../domain/trip_day.dart';
import '../domain/trip_day_rules.dart';
import 'trip_day_providers.dart';

class TripDaysScreen extends ConsumerWidget {
  const TripDaysScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trip = ref.watch(activeTripProvider);
    final days = ref.watch(activeTripDaysProvider);
    return PopScope(
      canPop: context.canPop(),
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) _returnToPreviousScreen(context);
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: BackButton(
            onPressed: () => _returnToPreviousScreen(context),
          ),
          title: const Text('Itinerary'),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: TripSelector(compact: true),
            ),
          ],
        ),
        floatingActionButton: trip == null
            ? null
            : FloatingActionButton.extended(
                onPressed: () => context.push('/trip/days/new'),
                icon: const Icon(Icons.add),
                label: const Text('Add day'),
              ),
        body: trip == null
            ? const AppEmptyState(
                icon: Icons.luggage_outlined,
                title: 'Choose a trip first',
                message: 'Select a trip before planning its days.',
              )
            : Column(
                children: [
                  _TripDaysHeader(tripName: trip.name),
                  Expanded(
                    child: days.when(
                      loading: () => const AppLoadingState(
                        label: 'Opening your itinerary…',
                      ),
                      error: (_, __) => AppErrorState(
                        message:
                            'Your itinerary could not be loaded. Please check your connection and try again.',
                        onRetry: () => ref.invalidate(activeTripDaysProvider),
                      ),
                      data: (items) => items.isEmpty
                          ? _EmptyDays(
                              onGenerate: () =>
                                  _generate(context, ref, trip, items),
                              onAdd: () => context.push('/trip/days/new'),
                            )
                          : _DaysList(
                              days: items,
                              onGenerate: () =>
                                  _generate(context, ref, trip, items),
                            ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  void _returnToPreviousScreen(BuildContext context) {
    if (GoRouter.of(context).canPop()) {
      context.pop();
      return;
    }
    context.go('/home');
  }

  Future<void> _generate(
    BuildContext context,
    WidgetRef ref,
    Trip trip,
    List<TripDay> existingDays,
  ) async {
    final missingDates = TripDayRules.missingDates(
      trip: trip,
      existingDays: existingDays,
    );
    if (missingDates.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Every date in this trip already has a day.'),
        ),
      );
      return;
    }
    try {
      final generated = await ref
          .read(tripDayRepositoryProvider)
          .generateMissingDays(
            tripId: trip.id,
            existingDays: existingDays,
            missingDates: missingDates,
          );
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              generated == 0
                  ? 'Every date in this trip already has a day.'
                  : '$generated trip days generated.',
            ),
          ),
        );
      }
    } catch (error) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not generate trip days: $error')),
        );
      }
    }
  }
}

class _TripDaysHeader extends StatelessWidget {
  const _TripDaysHeader({required this.tripName});

  final String tripName;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.fromLTRB(
      AppSpacing.lg,
      AppSpacing.md,
      AppSpacing.lg,
      AppSpacing.sm,
    ),
    child: Row(
      children: [
        const Icon(Icons.calendar_month_outlined, color: AppColors.seoulBlue),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: Text(
            'Planning $tripName',
            style: Theme.of(context).textTheme.titleLarge,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  );
}

class _EmptyDays extends StatelessWidget {
  const _EmptyDays({required this.onGenerate, required this.onAdd});

  final VoidCallback onGenerate;
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) => AppEmptyState(
    icon: Icons.calendar_today_outlined,
    title: 'Your itinerary is ready to begin',
    message: 'Generate a day for each trip date, or start with a custom day.',
    action: Column(
      children: [
        AppPrimaryButton(label: 'Generate trip days', onPressed: onGenerate),
        const SizedBox(height: AppSpacing.sm),
        OutlinedButton(onPressed: onAdd, child: const Text('Add day manually')),
      ],
    ),
  );
}

class _DaysList extends ConsumerWidget {
  const _DaysList({required this.days, required this.onGenerate});

  final List<TripDay> days;
  final VoidCallback onGenerate;

  @override
  Widget build(BuildContext context, WidgetRef ref) => Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
        child: Align(
          alignment: Alignment.centerRight,
          child: TextButton.icon(
            onPressed: onGenerate,
            icon: const Icon(Icons.auto_awesome_outlined),
            label: const Text('Generate missing days'),
          ),
        ),
      ),
      Expanded(
        child: ReorderableListView.builder(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.lg,
            AppSpacing.sm,
            AppSpacing.lg,
            AppSpacing.xxl,
          ),
          itemCount: days.length,
          onReorderItem: (oldIndex, newIndex) =>
              _reorder(context, ref, oldIndex: oldIndex, newIndex: newIndex),
          itemBuilder: (context, index) {
            final day = days[index];
            return Padding(
              key: ValueKey(day.id),
              padding: const EdgeInsets.only(bottom: AppSpacing.sm),
              child: _DayCard(day: day, number: index + 1),
            );
          },
        ),
      ),
    ],
  );

  Future<void> _reorder(
    BuildContext context,
    WidgetRef ref, {
    required int oldIndex,
    required int newIndex,
  }) async {
    final reordered = [...days];
    final moved = reordered.removeAt(oldIndex);
    reordered.insert(newIndex, moved);
    final trip = ref.read(activeTripProvider);
    if (trip == null) return;
    try {
      await ref
          .read(tripDayRepositoryProvider)
          .reorderDays(tripId: trip.id, orderedDays: reordered);
    } catch (error) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not reorder days: $error')),
        );
      }
    }
  }
}

class _DayCard extends StatelessWidget {
  const _DayCard({required this.day, required this.number});

  final TripDay day;
  final int number;

  @override
  Widget build(BuildContext context) => AppCard(
    padding: EdgeInsets.zero,
    child: InkWell(
      onTap: () => context.push('/trip/days/${day.id}'),
      borderRadius: BorderRadius.circular(AppRadius.standard),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.surfaceVariant,
              foregroundColor: AppColors.seoulBlue,
              child: Text('$number'),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    day.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    MaterialLocalizations.of(
                      context,
                    ).formatMediumDate(day.date),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  if (day.summary.isNotEmpty) ...[
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      day.summary,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ],
              ),
            ),
            const Icon(Icons.drag_handle),
          ],
        ),
      ),
    ),
  );
}
