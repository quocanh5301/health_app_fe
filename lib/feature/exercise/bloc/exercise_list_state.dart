import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:health_app_flutter/data/model/exercise_model.dart';

part 'exercise_list_state.freezed.dart';

@freezed
class ExerciseListState with _$ExerciseListState {
  const factory ExerciseListState({
    @Default([]) List<ExerciseModel> exercises,
    @Default(1) int page,
    @Default("all") String filterType, // muscle group , difficulty , all
    @Default("") String filterValue,
    @Default("") String mess,
    @Default(GetExerciseStatus.initial) GetExerciseStatus getExerciseStatus,
  }) = _ExerciseListState;
}

enum GetExerciseStatus { initial, getting, finish, error, noMore }

enum DeleteExerciseStatus { initial, deleting, finish, error }

// // ignore: constant_identifier_names
// enum MuscleGroupFilter { chest, upper_back, lower_back, shoulders, biceps, triceps, forearms, core, calves, thighs, glutes, full_body }

// enum DifficultyFilter { beginner, intermediate, advance }