import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';
import '../../domain/trip.dart';

class TripCard extends StatelessWidget {
  const TripCard({required this.trip, required this.onTap, super.key});

  final Trip trip;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final dates =
        '${_date(trip.startDate)} – ${_date(trip.endDate)} · ${trip.memberIds.length} travelers';
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Row(
            children: [
              Container(
                height: AppSpacing.xxl,
                width: AppSpacing.xxl,
                decoration: BoxDecoration(
                  color: AppColors.surfaceVariant,
                  borderRadius: BorderRadius.circular(AppRadius.standard),
                ),
                child: const Icon(
                  Icons.flight_takeoff,
                  color: AppColors.seoulBlue,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      trip.name,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      trip.destination,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(dates, style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }

  String _date(DateTime date) => '${date.day}.${date.month}.${date.year}';
}
