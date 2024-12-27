import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_app_flutter/feature/bookmark_exercise/bloc/bookmark_exercise_state.dart';
import 'package:health_app_flutter/feature/bookmark_exercise/repository/bookmark_exercise_repository.dart';

class BookmarkExerciseCubit extends Cubit<BookmarkExerciseState> {
  BookmarkExerciseCubit({
    required this.bookmarkExerciseRepository,
  }) : super(const BookmarkExerciseState());

  final BookmarkExerciseRepository bookmarkExerciseRepository;

  Future<void> getBookmarkExercise() async {
    emit(state.copyWith(
      getBookmarkExerciseStatus: GetBookmarkExerciseStatus.getting,
    ));
    try {
      final result = await bookmarkExerciseRepository
          .getBookmarkExercise(
            page: state.page + 1,
          )
          .run();

      result.match(
        (error) => emit(
          state.copyWith(
            mess: error,
            getBookmarkExerciseStatus: GetBookmarkExerciseStatus.error,
          ),
        ),
        (response) async {
          emit(
            state.copyWith(
              getBookmarkExerciseStatus: GetBookmarkExerciseStatus.finish,
              bookmarkExercises: [
                ...state.bookmarkExercises,
                ...response,
              ],
            ),
          );
        },
      );
    } catch (e) {
      emit(state.copyWith(
        mess: e.toString(),
        getBookmarkExerciseStatus: GetBookmarkExerciseStatus.error,
      ));
    }
  }

  Future<void> refreshBookmarkExercise() async {
    emit(state.copyWith(
      getBookmarkExerciseStatus: GetBookmarkExerciseStatus.getting,
    ));
    debugPrint("BookmarkExerciseList refreshBookmarkExercise");
    try {
      final result = await bookmarkExerciseRepository
          .getBookmarkExercise(
            page: 1,
          )
          .run();

      result.match(
        (error) {
          emit(
            state.copyWith(
              mess: error,
              getBookmarkExerciseStatus: GetBookmarkExerciseStatus.error,
            ),
          );
        },
        (response) async {
          emit(
            state.copyWith(
              getBookmarkExerciseStatus: GetBookmarkExerciseStatus.finish,
              bookmarkExercises: response,
            ),
          );
        },
      );
    } catch (e) {
      emit(state.copyWith(
        mess: e.toString(),
        getBookmarkExerciseStatus: GetBookmarkExerciseStatus.error,
        bookmarkExercises: [],
      ));
    }
  }
}
