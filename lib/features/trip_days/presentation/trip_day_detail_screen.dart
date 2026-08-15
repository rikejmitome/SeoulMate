import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_theme.dart';
import '../../../shared/widgets/app_ui.dart';
import '../../trip/presentation/trip_providers.dart';
import '../domain/trip_day.dart';
import 'trip_day_providers.dart';

class TripDayDetailScreen extends ConsumerWidget {
  const TripDayDetailScreen({required this.dayId, super.key});

  final String dayId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final day = ref.watch(activeTripDayProvider(dayId));
    return day.when(
      loading: () =>
          const Scaffold(body: AppLoadingState(label: 'Opening day…')),
      error: (_, __) => const Scaffold(
        body: AppErrorState(message: 'This day could not be opened.'),
      ),
      data: (item) {
        if (item == null) {
          return const Scaffold(
            body: AppEmptyState(
              icon: Icons.calendar_today_outlined,
              title: 'Day unavailable',
              message: 'It is no longer part of the selected trip.',
            ),
          );
        }
        return _TripDayDetail(day: item);
      },
    );
  }
}

class _TripDayDetail extends ConsumerWidget {
  const _TripDayDetail({required this.day});

  final TripDay day;

  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
    appBar: AppBar(
      title: Text(day.title),
      actions: [
        IconButton(
          tooltip: 'Edit day',
          onPressed: () => _edit(context),
          icon: const Icon(Icons.edit_outlined),
        ),
        IconButton(
          tooltip: 'Delete day',
          onPressed: () => _delete(context, ref),
          icon: const Icon(Icons.delete_outline),
        ),
      ],
    ),
    body: SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          Text(day.title, style: Theme.of(context).textTheme.displaySmall),
          const SizedBox(height: AppSpacing.sm),
          Text(
            MaterialLocalizations.of(context).formatFullDate(day.date),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          if (day.summary.isNotEmpty) ...[
            const SizedBox(height: AppSpacing.lg),
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Summary',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(day.summary),
                ],
              ),
            ),
          ],
          const SizedBox(height: AppSpacing.lg),
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Activities',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: AppSpacing.sm),
                const Text('No activities yet.'),
              ],
            ),
          ),
        ],
      ),
    ),
  );

  Future<void> _delete(BuildContext context, WidgetRef ref) async {
    final confirmed = await showAppConfirmation(
      context,
      title: 'Delete day?',
      message: 'This removes ${day.title} from the selected trip.',
      confirmLabel: 'Delete',
    );
    if (!confirmed || !context.mounted) return;
    final trip = ref.read(activeTripProvider);
    if (trip == null) return;
    try {
      await ref
          .read(tripDayRepositoryProvider)
          .deleteDay(tripId: trip.id, dayId: day.id);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Day deleted from the itinerary.')),
        );
        context.pop();
      }
    } catch (error) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Could not delete day: $error')));
      }
    }
  }

  Future<void> _edit(BuildContext context) async {
    final updatedDayId = await context.push<String>(
      '/trip/days/${day.id}/edit',
    );
    if (updatedDayId == null || !context.mounted) return;
    if (updatedDayId != day.id) {
      context.replace('/trip/days/$updatedDayId');
      return;
    }
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Day changes saved.')));
  }
}
