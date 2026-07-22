import 'package:freezed_annotation/freezed_annotation.dart';

part 'trip.freezed.dart';

@freezed
abstract class Trip with _$Trip {
  const factory Trip({
    required String id,
    required String name,
    required String destination,
    required DateTime startDate,
    required DateTime endDate,
    required String currency,
    String? coverImageUrl,
    required String ownerId,
    required List<String> memberIds,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Trip;
}

@freezed
abstract class TripMember with _$TripMember {
  const factory TripMember({
    required String userId,
    required String displayName,
    required String email,
    required String role,
    required DateTime joinedAt,
  }) = _TripMember;
}

class TripDraft {
  const TripDraft({
    required this.name,
    required this.destination,
    required this.startDate,
    required this.endDate,
    required this.currency,
  });

  final String name;
  final String destination;
  final DateTime startDate;
  final DateTime endDate;
  final String currency;
}
