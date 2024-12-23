// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'exercise_detail_model.freezed.dart';
part 'exercise_detail_model.g.dart';

@freezed
class ExerciseDetailModel with _$ExerciseDetailModel {
  const factory ExerciseDetailModel({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'exercise_name') String? exerciseName,
    @JsonKey(name: 'calor') int? calor,
    @JsonKey(name: 'duration') int? duration,
    @JsonKey(name: 'guide') String? guide,
    @JsonKey(name: 'difficulty') String? difficulty,
    @JsonKey(name: 'image') String? image,
    @JsonKey(name: 'muscle_groups') List<String>? muscleGroups,
    @JsonKey(name: 'guide_images') List<String>? guideImages,
    @JsonKey(name: 'is_favorite') bool? isFavorite,
    
  }) = _ExerciseDetailModel;

  factory ExerciseDetailModel.fromJson(Map<String, dynamic> json) =>
      _$ExerciseDetailModelFromJson(json);
}
