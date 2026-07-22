import 'package:flutter_test/flutter_test.dart';
import 'package:seoulmate/features/places/domain/place_vote.dart';

void main() {
  PlaceVote vote(String userId, VoteChoice choice) => PlaceVote(
    userId: userId,
    displayName: userId == 'one' ? 'One Traveler' : 'Two Traveler',
    choice: choice,
    updatedAt: DateTime(2026),
  );

  group('PlaceVoting', () {
    test('keeps one current vote per user', () {
      final votes = PlaceVoting.applyVote([
        vote('one', VoteChoice.want),
      ], vote('one', VoteChoice.maybe));

      expect(votes, hasLength(1));
      expect(votes.single.choice, VoteChoice.maybe);
    });

    test('changes a member vote without changing another member vote', () {
      final votes = PlaceVoting.applyVote([
        vote('one', VoteChoice.want),
        vote('two', VoteChoice.skip),
      ], vote('one', VoteChoice.maybe));

      expect(
        votes.where((item) => item.userId == 'one').single.choice,
        VoteChoice.maybe,
      );
      expect(
        votes.where((item) => item.userId == 'two').single.choice,
        VoteChoice.skip,
      );
    });

    test('removes only the requesting member vote', () {
      final votes = PlaceVoting.removeVote([
        vote('one', VoteChoice.want),
        vote('two', VoteChoice.skip),
      ], 'one');

      expect(votes, hasLength(1));
      expect(votes.single.userId, 'two');
    });

    test('aggregates vote totals for every choice', () {
      final totals = PlaceVoting.totals([
        vote('one', VoteChoice.want),
        vote('two', VoteChoice.want),
        vote('three', VoteChoice.maybe),
      ]);

      expect(totals.want, 2);
      expect(totals.maybe, 1);
      expect(totals.skip, 0);
    });

    test('keeps vote collections isolated by active trip path', () {
      final firstTrip = PlaceVotePath.collection(
        tripId: 'trip-one',
        placeId: 'place-a',
      );
      final secondTrip = PlaceVotePath.collection(
        tripId: 'trip-two',
        placeId: 'place-a',
      );

      expect(firstTrip, 'trips/trip-one/places/place-a/votes');
      expect(secondTrip, 'trips/trip-two/places/place-a/votes');
      expect(firstTrip, isNot(secondTrip));
    });
  });
}
