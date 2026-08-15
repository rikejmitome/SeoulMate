import 'package:freezed_annotation/freezed_annotation.dart';

part 'trip_day.freezed.dart';

@freezed
abstract class TripDay with _$TripDay {
  const factory TripDay({
    required String id,
    required String tripId,
    required DateTime date,
    required String title,
    required String summary,
    required int order,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _TripDay;
}

class TripDayDraft {
  const TripDayDraft({
    required this.date,
    required this.title,
    required this.summary,
  });

  final DateTime date;
  final String title;
  final String summary;
}
