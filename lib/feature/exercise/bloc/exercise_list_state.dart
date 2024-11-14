import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:health_app_flutter/data/model/exercise_model.dart';

part 'exercise_list_state.freezed.dart';

@freezed
class ExerciseListState with _$ExerciseListState {
  const factory ExerciseListState({
    @Default([]) List<ExerciseModel> exercises,
    @Default("") String mess,
    @Default(GetExerciseStatus.initial) GetExerciseStatus getExerciseStatus,
  }) = _ExerciseListState;
}

enum GetExerciseStatus { initial, getting, finish, error }

enum DeleteExerciseStatus { initial, deleting, finish, error }
