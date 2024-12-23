import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:health_app_flutter/data/model/exercise_detail_model.dart';

part 'exercise_detail_state.freezed.dart';

@freezed
class ExerciseDetailState with _$ExerciseDetailState {
  const factory ExerciseDetailState({
    @Default(ExerciseDetailModel()) ExerciseDetailModel exerciseDetail,
    @Default("") String mess,
    @Default(GetExerciseDetailStatus.initial)
    GetExerciseDetailStatus getExerciseDetailStatus,
    @Default(MarkFavoriteExerciseStatus.initial)
    MarkFavoriteExerciseStatus markFavoriteExerciseStatus,
  }) = _ExerciseDetailState;
}

enum GetExerciseDetailStatus { initial, getting, finish, error, noMore }

enum MarkFavoriteExerciseStatus { initial, loading, finish, error }
