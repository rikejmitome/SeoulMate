import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_theme.dart';
import '../../../shared/widgets/app_primary_button.dart';
import '../../../shared/widgets/app_ui.dart';
import '../../trip/presentation/trip_providers.dart';
import 'place_providers.dart';

class EditPlaceScreen extends ConsumerStatefulWidget {
  const EditPlaceScreen({required this.placeId, super.key});

  final String placeId;

  @override
  ConsumerState<EditPlaceScreen> createState() => _EditPlaceScreenState();
}

class _EditPlaceScreenState extends ConsumerState<EditPlaceScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _koreanNameController = TextEditingController();
  final _addressController = TextEditingController();
  final _googleMapsController = TextEditingController();
  final _naverMapsController = TextEditingController();
  final _kakaoMapsController = TextEditingController();
  final _notesController = TextEditingController();
  String _category = _categories.first;
  String _status = 'planned';
  bool _isSaving = false;
  bool _isInitialized = false;
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
    _googleMapsController.dispose();
    _naverMapsController.dispose();
    _kakaoMapsController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  void _initialize() {
    final place = ref.read(activePlaceProvider(widget.placeId)).asData?.value;
    if (place == null || _isInitialized) return;
    _isInitialized = true;
    _nameController.text = place.name;
    _koreanNameController.text = place.koreanName;
    _addressController.text = place.address;
    _googleMapsController.text = place.googleMapsUrl;
    _naverMapsController.text = place.naverMapsUrl;
    _kakaoMapsController.text = place.kakaoMapsUrl;
    _notesController.text = place.notes;
    _category = _categories.contains(place.category)
        ? place.category
        : _categories.first;
    _status = place.status == 'visited' ? 'visited' : 'planned';
  }

  Future<void> _save() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    final trip = ref.read(activeTripProvider);
    final place = ref.read(activePlaceProvider(widget.placeId)).asData?.value;
    if (trip == null || place == null) {
      setState(
        () =>
            _error = 'This place is no longer available in the selected trip.',
      );
      return;
    }
    setState(() {
      _isSaving = true;
      _error = null;
    });
    try {
      await ref
          .read(placeRepositoryProvider)
          .update(
            tripId: trip.id,
            place: place.copyWith(
              name: _nameController.text.trim(),
              koreanName: _koreanNameController.text.trim(),
              category: _category,
              address: _addressController.text.trim(),
              googleMapsUrl: _googleMapsController.text.trim(),
              naverMapsUrl: _naverMapsController.text.trim(),
              kakaoMapsUrl: _kakaoMapsController.text.trim(),
              notes: _notesController.text.trim(),
              status: _status,
            ),
          );
      if (mounted) context.pop(true);
    } catch (error) {
      if (mounted)
        setState(() => _error = 'SeoulMate could not save this place. $error');
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final place = ref.watch(activePlaceProvider(widget.placeId));
    _initialize();
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
        return Scaffold(
          appBar: AppBar(title: const Text('Edit place')),
          body: SafeArea(
            child: Form(
              key: _formKey,
              child: ListView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                padding: const EdgeInsets.all(AppSpacing.lg),
                children: [
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
                          (value) => DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          ),
                        )
                        .toList(),
                    onChanged: _isSaving
                        ? null
                        : (value) =>
                              setState(() => _category = value ?? _category),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  DropdownButtonFormField<String>(
                    initialValue: _status,
                    decoration: const InputDecoration(
                      labelText: 'Visit status',
                    ),
                    items: const [
                      DropdownMenuItem(
                        value: 'planned',
                        child: Text('Planned'),
                      ),
                      DropdownMenuItem(
                        value: 'visited',
                        child: Text('Visited'),
                      ),
                    ],
                    onChanged: _isSaving
                        ? null
                        : (value) => setState(() => _status = value ?? _status),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  TextFormField(
                    controller: _addressController,
                    textCapitalization: TextCapitalization.words,
                    decoration: const InputDecoration(
                      labelText: 'Address or area',
                    ),
                    validator: (value) => value == null || value.trim().isEmpty
                        ? 'Enter an address or area.'
                        : null,
                  ),
                  const SizedBox(height: AppSpacing.md),
                  TextFormField(
                    controller: _googleMapsController,
                    keyboardType: TextInputType.url,
                    decoration: const InputDecoration(
                      labelText: 'Google Maps link (optional)',
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  TextFormField(
                    controller: _naverMapsController,
                    keyboardType: TextInputType.url,
                    decoration: const InputDecoration(
                      labelText: 'Naver Map link (optional)',
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  TextFormField(
                    controller: _kakaoMapsController,
                    keyboardType: TextInputType.url,
                    decoration: const InputDecoration(
                      labelText: 'Kakao Map link (optional)',
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
                    Text(
                      _error!,
                      style: const TextStyle(color: AppColors.error),
                    ),
                  ],
                  const SizedBox(height: AppSpacing.xl),
                  AppPrimaryButton(
                    label: 'Save changes',
                    onPressed: _save,
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
