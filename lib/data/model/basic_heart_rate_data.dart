// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'basic_heart_rate_data.freezed.dart';
part 'basic_heart_rate_data.g.dart';

@freezed
class BasicHeartRateData with _$BasicHeartRateData {
  const factory BasicHeartRateData({
    // @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'user_id') int? userId,
    @JsonKey(name: 'measured_at') String? measuredAt, //"0,6" km in string form
    @JsonKey(name: 'heart_rate') int? bpm,
    @JsonKey(name: 'stress_level') int? stressLevel, //in miliseconds
  }) = _BasicHeartRateData;

  factory BasicHeartRateData.fromJson(Map<String, dynamic> json) => _$BasicHeartRateDataFromJson(json);
}