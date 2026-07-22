import 'package:freezed_annotation/freezed_annotation.dart';

part 'place.freezed.dart';

@freezed
abstract class Place with _$Place {
  const factory Place({
    required String id,
    required String name,
    required String koreanName,
    required String category,
    required String address,
    required String googleMapsUrl,
    required String naverMapsUrl,
    required String kakaoMapsUrl,
    required String notes,
    required String status,
    required DateTime createdAt,
  }) = _Place;
}
