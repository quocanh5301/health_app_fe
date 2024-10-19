import 'package:freezed_annotation/freezed_annotation.dart';

part 'run_data.freezed.dart';
part 'run_data.g.dart';

@freezed
class RunData with _$RunData {
  const factory RunData({
    @Default(0) double distanceTraveled,
    @Default(0) int stepsCount,
    @Default(Duration.zero) Duration timePassed,
  }) = _RunData;

  factory RunData.fromJson(Map<String, dynamic> json) =>
      _$RunDataFromJson(json);
}
