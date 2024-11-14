import 'package:freezed_annotation/freezed_annotation.dart';

part 'exercise_model.freezed.dart';
part 'exercise_model.g.dart';

@freezed
class ExerciseModel with _$ExerciseModel {
  const factory ExerciseModel({
    @Default(0) int id,
    @Default("") String name,
    @Default(0) int calor,
    @Default(0) int time,
    @Default("") String guide,
    @Default("") String muscleGroup,  //Chest, Upper Back, Lower Back, Shoulder, Biceps, Triceps, Forearms, Thighs, Calves, Core, Glutes, Full Body
    @Default("") String difficulty,   //beginner, intermediate, advanced
  }) = _ExerciseModel;

  factory ExerciseModel.fromJson(Map<String, dynamic> json) =>
      _$ExerciseModelFromJson(json);
}