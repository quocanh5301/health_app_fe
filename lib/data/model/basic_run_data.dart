// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'basic_run_data.freezed.dart';
part 'basic_run_data.g.dart';

@freezed
class BasicRunData with _$BasicRunData {
  const factory BasicRunData({
    @JsonKey(name: 'run_date') String? date,
    @JsonKey(name: 'total_distance') String? distance, //"0,6" km in string form
    @JsonKey(name: 'total_steps') int? steps,
    @JsonKey(name: 'total_duration') int? duration, //in miliseconds
  }) = _BasicRunData;

  factory BasicRunData.fromJson(Map<String, dynamic> json) => _$BasicRunDataFromJson(json);
}