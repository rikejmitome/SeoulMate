import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_vote.freezed.dart';

enum VoteChoice { want, maybe, skip }

extension VoteChoiceX on VoteChoice {
  String get label => switch (this) {
    VoteChoice.want => 'Want',
    VoteChoice.maybe => 'Maybe',
    VoteChoice.skip => 'Skip',
  };
}

@freezed
abstract class PlaceVote with _$PlaceVote {
  const factory PlaceVote({
    required String userId,
    required String displayName,
    required VoteChoice choice,
    required DateTime updatedAt,
  }) = _PlaceVote;
}

class VoteTotals {
  const VoteTotals({
    required this.want,
    required this.maybe,
    required this.skip,
  });

  final int want;
  final int maybe;
  final int skip;
}

abstract final class PlaceVoting {
  static List<PlaceVote> applyVote(List<PlaceVote> votes, PlaceVote vote) => [
    ...votes.where((item) => item.userId != vote.userId),
    vote,
  ];

  static List<PlaceVote> removeVote(List<PlaceVote> votes, String userId) =>
      votes.where((vote) => vote.userId != userId).toList();

  static VoteTotals totals(List<PlaceVote> votes) => VoteTotals(
    want: votes.where((vote) => vote.choice == VoteChoice.want).length,
    maybe: votes.where((vote) => vote.choice == VoteChoice.maybe).length,
    skip: votes.where((vote) => vote.choice == VoteChoice.skip).length,
  );
}

abstract final class PlaceVotePath {
  static String collection({required String tripId, required String placeId}) =>
      'trips/$tripId/places/$placeId/votes';
}
