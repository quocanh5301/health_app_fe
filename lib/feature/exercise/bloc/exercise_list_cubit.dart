import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_app_flutter/feature/exercise/bloc/exercise_list_state.dart';
import 'package:health_app_flutter/feature/exercise/repository/exercise_repository.dart';

class ExerciseListCubit extends Cubit<ExerciseListState> {
  ExerciseListCubit({
    required this.exerciseRepository,
  }) : super(const ExerciseListState());

  final ExerciseRepository exerciseRepository;

  Future<void> refreshExercises() async {
    emit(state.copyWith(
      getExerciseStatus: GetExerciseStatus.getting,
    ));
    try {
      final result = await exerciseRepository
          .getExerciseByFilter(
            page: 1,
            filterType: state.filterType,
            filterValue: state.filterValue,
          )
          .run();

      result.match(
        (error) => emit(
          state.copyWith(
            mess: error,
            getExerciseStatus: GetExerciseStatus.error,
          ),
        ),
        (response) async {
          emit(
            state.copyWith(
              getExerciseStatus: GetExerciseStatus.finish,
              exercises: response,
            ),
          );
        },
      );
    } catch (e) {
      emit(state.copyWith(
        mess: e.toString(),
        getExerciseStatus: GetExerciseStatus.error,
      ));
    }
  }

  Future<void> getFilteredExercises() async {
    debugPrint("getFilteredExercises");
    emit(state.copyWith(
      getExerciseStatus: GetExerciseStatus.getting,
    ));
    try {
      final result = await exerciseRepository
          .getExerciseByFilter(
            page: state.page,
            filterType: state.filterType,
            filterValue: state.filterValue,
          )
          .run();

      result.match(
        (error) => emit(
          state.copyWith(
            mess: error,
            getExerciseStatus: GetExerciseStatus.error,
          ),
        ),
        (response) async {
          debugPrint("getExercises response: $response");
          emit(
            state.copyWith(
              getExerciseStatus: GetExerciseStatus.finish,
              exercises: response,
            ),
          );
        },
      );
    } catch (e) {
      emit(state.copyWith(
        mess: e.toString(),
        getExerciseStatus: GetExerciseStatus.error,
      ));
    }
  }

  Future<void> getMoreExercises() async {
    debugPrint("getFilteredExercises");
    emit(state.copyWith(
      getExerciseStatus: GetExerciseStatus.getting,
    ));
    try {
      final result = await exerciseRepository
          .getExerciseByFilter(
            page: state.page + 1,
            filterType: state.filterType,
            filterValue: state.filterValue,
          )
          .run();

      result.match(
        (error) => emit(
          state.copyWith(
            mess: error,
            getExerciseStatus: GetExerciseStatus.error,
          ),
        ),
        (response) async {
          if (response.length < 10) {
            emit(
              state.copyWith(
                getExerciseStatus: GetExerciseStatus.noMore,
                page: state.page + 1,
                exercises: [
                  ...state.exercises,
                  ...response,
                ],
              ),
            );
          } else {
            emit(
              state.copyWith(
                getExerciseStatus: GetExerciseStatus.finish,
                page: state.page + 1,
                exercises: [
                  ...state.exercises,
                  ...response,
                ],
              ),
            );
          }
        },
      );
    } catch (e) {
      emit(state.copyWith(
        mess: e.toString(),
        getExerciseStatus: GetExerciseStatus.error,
      ));
    }
  }

  void setFilterType(String filterType) async {
    debugPrint("Filter type: $filterType");
    if (filterType == state.filterType) {
      return;
    }

    switch (filterType) {
      case "all":
        emit(
          state.copyWith(
            filterType: filterType,
            filterValue: "",
            page: 1,
            getExerciseStatus: GetExerciseStatus.initial,
          ),
        );
        break;
      case "muscle_group":
        emit(
          state.copyWith(
            filterType: filterType,
            filterValue: "chest",
            page: 1,
            getExerciseStatus: GetExerciseStatus.initial,
          ),
        );
        break;
      case "difficulty":
        emit(
          state.copyWith(
            filterType: filterType,
            filterValue: "beginner",
            page: 1,
          ),
        );
        break;
      default:
    }
    await getFilteredExercises();
  }

  void setFilterValue(String filterValue) async {
    emit(
      state.copyWith(
        filterValue: state.filterType == "all" ? "" : filterValue,
        page: 1,
        getExerciseStatus: GetExerciseStatus.initial,
      ),
    );
    await getFilteredExercises();
  }
}
