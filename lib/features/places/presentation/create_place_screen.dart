import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_theme.dart';
import '../../../shared/widgets/app_primary_button.dart';
import '../../trip/presentation/trip_providers.dart';
import '../domain/place.dart';
import 'place_providers.dart';

class CreatePlaceScreen extends ConsumerStatefulWidget {
  const CreatePlaceScreen({super.key});

  @override
  ConsumerState<CreatePlaceScreen> createState() => _CreatePlaceScreenState();
}

class _CreatePlaceScreenState extends ConsumerState<CreatePlaceScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _koreanNameController = TextEditingController();
  final _addressController = TextEditingController();
  final _mapLinkController = TextEditingController();
  final _notesController = TextEditingController();
  String _category = _categories.first;
  String _status = 'planned';
  bool _isSaving = false;
  String? _error;

  static const _categories = [
    'Restaurant',
    'Café',
    'Culture',
    'Shopping',
    'Nature',
    'Nightlife',
    'Experience',
    'Hidden gem',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _koreanNameController.dispose();
    _addressController.dispose();
    _mapLinkController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    final trip = ref.read(activeTripProvider);
    if (trip == null) {
      setState(() => _error = 'Choose a trip before saving a place.');
      return;
    }

    setState(() {
      _isSaving = true;
      _error = null;
    });
    try {
      await ref
          .read(placeRepositoryProvider)
          .create(
            tripId: trip.id,
            place: Place(
              id: '',
              name: _nameController.text.trim(),
              koreanName: _koreanNameController.text.trim(),
              category: _category,
              address: _addressController.text.trim(),
              googleMapsUrl: _mapLinkController.text.trim(),
              naverMapsUrl: '',
              kakaoMapsUrl: '',
              notes: _notesController.text.trim(),
              status: _status,
              votes: const {},
              createdAt: DateTime.now(),
            ),
          );
      if (mounted) context.pop(true);
    } catch (error) {
      if (mounted) {
        setState(() => _error = 'SeoulMate could not save this place. $error');
      }
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final activeTrip = ref.watch(activeTripProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Add place')),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: const EdgeInsets.all(AppSpacing.lg),
            children: [
              Text(
                activeTrip == null
                    ? 'Save a place for your shared itinerary.'
                    : 'This place will be saved to ${activeTrip.name}.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: AppSpacing.lg),
              TextFormField(
                controller: _nameController,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(labelText: 'Place name'),
                validator: (value) => value == null || value.trim().isEmpty
                    ? 'Enter a place name.'
                    : null,
              ),
              const SizedBox(height: AppSpacing.md),
              TextFormField(
                controller: _koreanNameController,
                decoration: const InputDecoration(
                  labelText: 'Korean name (optional)',
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              DropdownButtonFormField<String>(
                initialValue: _category,
                decoration: const InputDecoration(labelText: 'Category'),
                items: _categories
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(category),
                      ),
                    )
                    .toList(),
                onChanged: _isSaving
                    ? null
                    : (value) => setState(() => _category = value ?? _category),
              ),
              const SizedBox(height: AppSpacing.md),
              DropdownButtonFormField<String>(
                initialValue: _status,
                decoration: const InputDecoration(labelText: 'Visit status'),
                items: const [
                  DropdownMenuItem(value: 'planned', child: Text('Planned')),
                  DropdownMenuItem(value: 'visited', child: Text('Visited')),
                ],
                onChanged: _isSaving
                    ? null
                    : (value) => setState(() => _status = value ?? _status),
              ),
              const SizedBox(height: AppSpacing.md),
              TextFormField(
                controller: _addressController,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(labelText: 'Address or area'),
                validator: (value) => value == null || value.trim().isEmpty
                    ? 'Enter an address or area.'
                    : null,
              ),
              const SizedBox(height: AppSpacing.md),
              TextFormField(
                controller: _mapLinkController,
                keyboardType: TextInputType.url,
                decoration: const InputDecoration(
                  labelText: 'Map link (optional)',
                  hintText: 'Google Maps, Naver Map or Kakao Map',
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              TextFormField(
                controller: _notesController,
                maxLines: 4,
                textCapitalization: TextCapitalization.sentences,
                decoration: const InputDecoration(
                  labelText: 'Notes (optional)',
                  alignLabelWithHint: true,
                ),
              ),
              if (_error != null) ...[
                const SizedBox(height: AppSpacing.md),
                Text(_error!, style: const TextStyle(color: AppColors.error)),
              ],
              const SizedBox(height: AppSpacing.xl),
              AppPrimaryButton(
                label: 'Save place',
                onPressed: _save,
                isLoading: _isSaving,
              ),
              const SizedBox(height: AppSpacing.lg),
            ],
          ),
        ),
      ),
    );
  }
}
