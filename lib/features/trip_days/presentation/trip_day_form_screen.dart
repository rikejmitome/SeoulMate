import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_theme.dart';
import '../../../shared/widgets/app_primary_button.dart';
import '../../../shared/widgets/app_ui.dart';
import '../../trip/presentation/trip_providers.dart';
import '../data/trip_day_repository.dart';
import '../domain/trip_day.dart';
import '../domain/trip_day_rules.dart';
import 'trip_day_providers.dart';

class TripDayFormScreen extends ConsumerStatefulWidget {
  const TripDayFormScreen({this.dayId, super.key});

  final String? dayId;

  @override
  ConsumerState<TripDayFormScreen> createState() => _TripDayFormScreenState();
}

class _TripDayFormScreenState extends ConsumerState<TripDayFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _summaryController = TextEditingController();
  DateTime? _date;
  bool _isInitialized = false;
  bool _isSaving = false;
  String? _error;

  @override
  void dispose() {
    _titleController.dispose();
    _summaryController.dispose();
    super.dispose();
  }

  Future<void> _chooseDate(DateTime initialDate) async {
    final trip = ref.read(activeTripProvider);
    if (trip == null) return;
    final selected = await showDatePicker(
      context: context,
      initialDate: _date ?? initialDate,
      firstDate: TripDayRules.dateOnly(trip.startDate),
      lastDate: TripDayRules.dateOnly(trip.endDate),
    );
    if (selected != null && mounted) setState(() => _date = selected);
  }

  void _initialize(TripDay? currentDay) {
    if (_isInitialized) return;
    final trip = ref.read(activeTripProvider);
    if (trip == null) return;
    _isInitialized = true;
    if (currentDay != null) {
      _date = currentDay.date;
      _titleController.text = currentDay.title;
      _summaryController.text = currentDay.summary;
      return;
    }
    _date = TripDayRules.dateOnly(trip.startDate);
    final existing = ref.read(activeTripDaysProvider).asData?.value ?? const [];
    _titleController.text = 'Day ${existing.length + 1}';
  }

  Future<void> _save(TripDay? currentDay) async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    final trip = ref.read(activeTripProvider);
    final date = _date;
    if (trip == null || date == null) {
      setState(() => _error = 'Choose a date for this day.');
      return;
    }
    final days = ref.read(activeTripDaysProvider).asData?.value ?? const [];
    final rangeError = TripDayRules.validateDate(trip: trip, date: date);
    final duplicateError = TripDayRules.validateUniqueDate(
      existingDays: days,
      date: date,
      excludingDayId: currentDay?.id,
    );
    if (rangeError != null || duplicateError != null) {
      setState(() => _error = rangeError ?? duplicateError);
      return;
    }

    setState(() {
      _isSaving = true;
      _error = null;
    });
    final draft = TripDayDraft(
      date: date,
      title: _titleController.text,
      summary: _summaryController.text,
    );
    try {
      final repository = ref.read(tripDayRepositoryProvider);
      if (currentDay == null) {
        await repository.createDay(
          tripId: trip.id,
          draft: draft,
          existingDays: days,
        );
      } else {
        await repository.updateDay(
          tripId: trip.id,
          currentDay: currentDay,
          draft: draft,
          existingDays: days,
        );
      }
      if (mounted) context.pop(TripDayRules.dateKey(date));
    } on TripDayDuplicateException catch (error) {
      if (mounted) setState(() => _error = error.message);
    } catch (error) {
      if (mounted) setState(() => _error = 'Could not save this day: $error');
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final day = widget.dayId == null
        ? const AsyncData<TripDay?>(null)
        : ref.watch(activeTripDayProvider(widget.dayId!));
    return day.when(
      loading: () =>
          const Scaffold(body: AppLoadingState(label: 'Opening day…')),
      error: (_, __) => const Scaffold(
        body: AppErrorState(message: 'This day could not be opened.'),
      ),
      data: (currentDay) {
        _initialize(currentDay);
        if (widget.dayId != null && currentDay == null) {
          return const Scaffold(
            body: AppEmptyState(
              icon: Icons.calendar_today_outlined,
              title: 'Day unavailable',
              message: 'It is no longer part of the selected trip.',
            ),
          );
        }
        final initialDate = _date ?? DateTime.now();
        return Scaffold(
          appBar: AppBar(
            title: Text(currentDay == null ? 'Add day' : 'Edit day'),
          ),
          body: SafeArea(
            child: Form(
              key: _formKey,
              child: ListView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                padding: const EdgeInsets.all(AppSpacing.lg),
                children: [
                  Text(
                    'This day belongs to the currently selected trip.',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  InkWell(
                    onTap: _isSaving ? null : () => _chooseDate(initialDate),
                    borderRadius: BorderRadius.circular(AppRadius.small),
                    child: InputDecorator(
                      decoration: const InputDecoration(labelText: 'Date'),
                      child: Text(
                        _date == null
                            ? 'Choose a date'
                            : MaterialLocalizations.of(
                                context,
                              ).formatMediumDate(_date!),
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  TextFormField(
                    controller: _titleController,
                    textCapitalization: TextCapitalization.words,
                    decoration: const InputDecoration(labelText: 'Day title'),
                    validator: (value) => value == null || value.trim().isEmpty
                        ? 'Enter a title for this day.'
                        : null,
                  ),
                  const SizedBox(height: AppSpacing.md),
                  TextFormField(
                    controller: _summaryController,
                    maxLines: 4,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: const InputDecoration(
                      labelText: 'Summary (optional)',
                      alignLabelWithHint: true,
                    ),
                  ),
                  if (_error != null) ...[
                    const SizedBox(height: AppSpacing.md),
                    Text(
                      _error!,
                      style: const TextStyle(color: AppColors.error),
                    ),
                  ],
                  const SizedBox(height: AppSpacing.xl),
                  AppPrimaryButton(
                    label: currentDay == null ? 'Add day' : 'Save changes',
                    onPressed: () => _save(currentDay),
                    isLoading: _isSaving,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
