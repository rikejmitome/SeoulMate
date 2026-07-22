import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_theme.dart';
import '../../../features/auth/presentation/auth_providers.dart';
import '../../../shared/widgets/app_primary_button.dart';
import '../domain/trip.dart';
import 'trip_providers.dart';

class TripFormScreen extends ConsumerStatefulWidget {
  const TripFormScreen({this.tripId, super.key});

  final String? tripId;

  @override
  ConsumerState<TripFormScreen> createState() => _TripFormScreenState();
}

class _TripFormScreenState extends ConsumerState<TripFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _destination = TextEditingController(text: 'South Korea');
  late DateTime _startDate;
  late DateTime _endDate;
  String _currency = 'KRW';
  bool _loading = false;
  String? _error;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    final today = DateTime.now();
    _startDate = DateTime(today.year, today.month, today.day);
    _endDate = _startDate.add(const Duration(days: 7));
  }

  @override
  void dispose() {
    _name.dispose();
    _destination.dispose();
    super.dispose();
  }

  Future<void> _chooseDate(bool isStart) async {
    final selected = await showDatePicker(
      context: context,
      initialDate: isStart ? _startDate : _endDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2035),
    );
    if (selected == null) return;
    setState(() {
      if (isStart) {
        _startDate = selected;
        if (_endDate.isBefore(selected)) _endDate = selected;
      } else {
        _endDate = selected;
      }
    });
  }

  Future<void> _save() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    if (_endDate.isBefore(_startDate)) {
      setState(
        () => _error = 'Your return date must follow your departure date.',
      );
      return;
    }
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final draft = TripDraft(
        name: _name.text,
        destination: _destination.text,
        startDate: _startDate,
        endDate: _endDate,
        currency: _currency,
      );
      final repository = ref.read(tripRepositoryProvider);
      if (widget.tripId == null) {
        final owner = ref.read(authRepositoryProvider).currentUser;
        if (owner == null)
          throw StateError('Please sign in again to create a trip.');
        final tripId = await repository.createTrip(draft: draft, owner: owner);
        await ref.read(selectedTripIdProvider.notifier).selectTrip(tripId);
      } else {
        await repository.updateTrip(tripId: widget.tripId!, draft: draft);
      }
      if (mounted) context.pop();
    } catch (error) {
      if (mounted) setState(() => _error = 'Could not save this trip: $error');
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final existing = widget.tripId == null
        ? null
        : ref.watch(tripProvider(widget.tripId!)).asData?.value;
    if (existing != null && !_isInitialized) {
      _isInitialized = true;
      _name.text = existing.name;
      _destination.text = existing.destination;
      _startDate = existing.startDate;
      _endDate = existing.endDate;
      _currency = existing.currency;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.tripId == null ? 'Create trip' : 'Edit trip'),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(AppSpacing.lg),
            children: [
              Text(
                'A beautiful shared home for your adventure.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: AppSpacing.lg),
              TextFormField(
                controller: _name,
                decoration: const InputDecoration(labelText: 'Trip name'),
                validator: (value) => value == null || value.trim().isEmpty
                    ? 'Enter a trip name.'
                    : null,
              ),
              const SizedBox(height: AppSpacing.md),
              TextFormField(
                controller: _destination,
                decoration: const InputDecoration(labelText: 'Destination'),
                validator: (value) => value == null || value.trim().isEmpty
                    ? 'Enter a destination.'
                    : null,
              ),
              const SizedBox(height: AppSpacing.md),
              _DateField(
                label: 'Start date',
                date: _startDate,
                onTap: () => _chooseDate(true),
              ),
              const SizedBox(height: AppSpacing.md),
              _DateField(
                label: 'End date',
                date: _endDate,
                onTap: () => _chooseDate(false),
              ),
              const SizedBox(height: AppSpacing.md),
              DropdownButtonFormField<String>(
                initialValue: _currency,
                decoration: const InputDecoration(labelText: 'Trip currency'),
                items: const ['KRW', 'CZK', 'EUR']
                    .map(
                      (currency) => DropdownMenuItem(
                        value: currency,
                        child: Text(currency),
                      ),
                    )
                    .toList(),
                onChanged: _loading
                    ? null
                    : (value) => setState(() => _currency = value ?? _currency),
              ),
              const SizedBox(height: AppSpacing.lg),
              Container(
                height: AppSpacing.xxl,
                decoration: BoxDecoration(
                  color: AppColors.surfaceVariant,
                  borderRadius: BorderRadius.circular(AppRadius.standard),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'A cover image can be added with your memories.',
                ),
              ),
              if (_error != null) ...[
                const SizedBox(height: AppSpacing.md),
                Text(_error!, style: const TextStyle(color: AppColors.error)),
              ],
              const SizedBox(height: AppSpacing.xl),
              AppPrimaryButton(
                label: widget.tripId == null ? 'Create trip' : 'Save changes',
                onPressed: _save,
                isLoading: _loading,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DateField extends StatelessWidget {
  const _DateField({
    required this.label,
    required this.date,
    required this.onTap,
  });
  final String label;
  final DateTime date;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) => InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(AppRadius.small),
    child: InputDecorator(
      decoration: InputDecoration(labelText: label),
      child: Text('${date.day}.${date.month}.${date.year}'),
    ),
  );
}
