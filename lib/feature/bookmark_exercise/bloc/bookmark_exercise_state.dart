import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:health_app_flutter/data/model/exercise_model.dart';

part 'bookmark_exercise_state.freezed.dart';

@freezed
class BookmarkExerciseState with _$BookmarkExerciseState {
  const factory BookmarkExerciseState({
    @Default([]) List<ExerciseModel> bookmarkExercises,
    @Default(0) int page,
    @Default("") String mess,
    @Default(GetBookmarkExerciseStatus.initial)
    GetBookmarkExerciseStatus getBookmarkExerciseStatus,
  }) = _BookmarkExerciseState;
}

enum GetBookmarkExerciseStatus { initial, getting, finish, error }
