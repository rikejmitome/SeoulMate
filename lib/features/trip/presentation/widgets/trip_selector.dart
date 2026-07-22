import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';
import '../../../../shared/widgets/app_ui.dart';
import '../../domain/trip.dart';
import '../trip_providers.dart';

class TripSelector extends ConsumerWidget {
  const TripSelector({this.compact = false, super.key});

  final bool compact;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trips = ref.watch(tripsProvider).asData?.value ?? const <Trip>[];
    final activeTrip = ref.watch(activeTripProvider);
    if (trips.isEmpty) return const SizedBox.shrink();

    return OutlinedButton.icon(
      onPressed: () => _showTripPicker(context, ref, trips, activeTrip?.id),
      icon: const Icon(Icons.swap_horiz, size: 18),
      label: compact
          ? const Text('Switch')
          : ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 190),
              child: Text(
                activeTrip?.name ?? 'Choose trip',
                overflow: TextOverflow.ellipsis,
              ),
            ),
    );
  }

  Future<void> _showTripPicker(
    BuildContext context,
    WidgetRef ref,
    List<Trip> trips,
    String? selectedTripId,
  ) {
    return showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      builder: (sheetContext) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.lg,
            0,
            AppSpacing.lg,
            AppSpacing.lg,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeader(
                'Switch trip',
                subtitle: 'Places and plans follow the trip you choose.',
              ),
              const SizedBox(height: AppSpacing.md),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.sizeOf(sheetContext).height * .5,
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: trips.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (_, index) {
                    final trip = trips[index];
                    final isSelected = trip.id == selectedTripId;
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: CircleAvatar(
                        backgroundColor: AppColors.surfaceVariant,
                        foregroundColor: AppColors.seoulBlue,
                        child: const Icon(Icons.flight_takeoff_outlined),
                      ),
                      title: Text(trip.name),
                      subtitle: Text(trip.destination),
                      trailing: isSelected
                          ? const Icon(
                              Icons.check_circle,
                              color: AppColors.seoulBlue,
                            )
                          : null,
                      onTap: () async {
                        await ref
                            .read(selectedTripIdProvider.notifier)
                            .selectTrip(trip.id);
                        if (sheetContext.mounted) Navigator.pop(sheetContext);
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.add_circle_outline),
                title: const Text('Create a new trip'),
                onTap: () {
                  Navigator.pop(sheetContext);
                  context.push('/trip/new');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
