import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_theme.dart';
import '../../auth/presentation/auth_providers.dart';
import 'trip_providers.dart';

class TripMembersScreen extends ConsumerStatefulWidget {
  const TripMembersScreen({required this.tripId, super.key});
  final String tripId;
  @override
  ConsumerState<TripMembersScreen> createState() => _TripMembersScreenState();
}

class _TripMembersScreenState extends ConsumerState<TripMembersScreen> {
  final _email = TextEditingController();
  bool _loading = false;
  String? _message;
  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  Future<void> _invite() async {
    if (!_email.text.contains('@')) {
      setState(() => _message = 'Enter a valid email address.');
      return;
    }
    setState(() {
      _loading = true;
      _message = null;
    });
    try {
      await ref
          .read(tripRepositoryProvider)
          .inviteMember(tripId: widget.tripId, email: _email.text);
      _email.clear();
      if (mounted) setState(() => _message = 'Invitation added to the trip.');
    } catch (error) {
      if (mounted)
        setState(
          () => _message = error.toString().replaceFirst(
            'TripInviteException: ',
            '',
          ),
        );
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final trip = ref.watch(tripProvider(widget.tripId)).asData?.value;
    final members = ref.watch(tripMembersProvider(widget.tripId));
    final isOwner =
        trip?.ownerId == ref.read(authRepositoryProvider).currentUser?.uid;
    return Scaffold(
      appBar: AppBar(title: const Text('Travelers')),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          if (isOwner) ...[
            Text(
              'Invite a traveler',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: AppSpacing.md),
            TextField(
              controller: _email,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(labelText: 'Email address'),
            ),
            const SizedBox(height: AppSpacing.md),
            FilledButton(
              onPressed: _loading ? null : _invite,
              child: Text(_loading ? 'Inviting…' : 'Invite member'),
            ),
            if (_message != null) ...[
              const SizedBox(height: AppSpacing.md),
              Text(_message!, style: Theme.of(context).textTheme.bodyMedium),
            ],
            const SizedBox(height: AppSpacing.xl),
          ],
          Text('Your group', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: AppSpacing.sm),
          members.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (_, __) =>
                const Text('Travelers are unavailable right now.'),
            data: (items) => Column(
              children: items
                  .map(
                    (member) => Card(
                      child: ListTile(
                        title: Text(member.displayName),
                        subtitle: Text(member.email),
                        trailing: isOwner && member.userId != trip?.ownerId
                            ? IconButton(
                                icon: const Icon(Icons.person_remove_outlined),
                                onPressed: () => ref
                                    .read(tripRepositoryProvider)
                                    .removeMember(
                                      tripId: widget.tripId,
                                      memberId: member.userId,
                                    ),
                              )
                            : Text(member.role),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
