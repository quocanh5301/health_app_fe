// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'exercise_model.freezed.dart';
part 'exercise_model.g.dart';

@freezed
class ExerciseModel with _$ExerciseModel {
  const factory ExerciseModel({
    @JsonKey(name: 'exercise_id') int? id,
    @JsonKey(name: 'exercise_name') String? name,
    @JsonKey(name: 'calor') int? calor,
    @JsonKey(name: 'duration') int? duration,
    @JsonKey(name: 'difficulty') String? difficulty,
    @JsonKey(name: 'image') String? image,
    @JsonKey(name: 'muscle_groups') List<String>? muscleGroups,
  }) = _ExerciseModel;

  factory ExerciseModel.fromJson(Map<String, dynamic> json) => _$ExerciseModelFromJson(json);
}