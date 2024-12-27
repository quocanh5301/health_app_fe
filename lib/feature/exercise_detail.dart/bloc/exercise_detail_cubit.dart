import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_app_flutter/feature/exercise_detail.dart/bloc/exercise_detail_state.dart';
import 'package:health_app_flutter/feature/exercise_detail.dart/repository/exercise_detail_repository.dart';

class ExerciseDetailCubit extends Cubit<ExerciseDetailState> {
  ExerciseDetailCubit({
    required this.exerciseDetailRepository,
  }) : super(const ExerciseDetailState());

  final ExerciseDetailRepository exerciseDetailRepository;

  Future<void> getExerciseDetail({
    required int exerciseId,
  }) async {
    emit(state.copyWith(
      getExerciseDetailStatus: GetExerciseDetailStatus.getting,
    ));
    try {
      final result = await exerciseDetailRepository
          .getExerciseDetail(
            exerciseId: exerciseId,
          )
          .run();

      result.match(
        (error) => emit(
          state.copyWith(
            mess: error,
            getExerciseDetailStatus: GetExerciseDetailStatus.error,
          ),
        ),
        (response) async {
          emit(
            state.copyWith(
              getExerciseDetailStatus: GetExerciseDetailStatus.finish,
              exerciseDetail: response,
            ),
          );
        },
      );
    } catch (e) {
      emit(state.copyWith(
        mess: e.toString(),
        getExerciseDetailStatus: GetExerciseDetailStatus.error,
      ));
    }
  }

  Future<void> markAsFavorite({
    required int exerciseId,
  }) async {
    emit(state.copyWith(
      markFavoriteExerciseStatus: MarkFavoriteExerciseStatus.loading,
    ));
    try {
      final result = await exerciseDetailRepository
          .markAsFavorite(
            exerciseId: exerciseId,
          )
          .run();

      result.match(
        (error) => emit(
          state.copyWith(
            mess: error,
            markFavoriteExerciseStatus: MarkFavoriteExerciseStatus.error,
          ),
        ),
        (response) async {
          debugPrint("markAsFavorite response: $response");
          emit(
            state.copyWith(
              markFavoriteExerciseStatus: MarkFavoriteExerciseStatus.finish,
              exerciseDetail: state.exerciseDetail.copyWith(
                isFavorite: !(state.exerciseDetail.isFavorite ?? false),
              ),
            ),
          );
        },
      );
    } catch (e) {
      emit(state.copyWith(
        mess: e.toString(),
        markFavoriteExerciseStatus: MarkFavoriteExerciseStatus.error,
      ));
    }
  }
}
