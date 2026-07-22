import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';

@freezed
abstract class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String id,
    required String displayName,
    required String email,
    String? photoUrl,
    required DateTime createdAt,
    DateTime? lastActiveAt,
  }) = _UserProfile;
}
