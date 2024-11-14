// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:health_app_flutter/data/model/exercise_model.dart';
// import 'package:health_app_flutter/feature/exercise/bloc/exercise_list_state.dart';

// class ExerciseListCubit extends Cubit<ExerciseListState> {
//   ExerciseListCubit() : super(const ExerciseListState());

//   Future<void> getExercises(DateTime date) async {
//     debugPrint("Date pass to function: $date");
//     emit(state.copyWith(
//       getExerciseStatus: GetExerciseStatus.getting,
//     ));
//     try {
//       final List<ExerciseModel> newExercises =
//           await _ExerciseDatabase.getSortedExercisesByDay(date);
//       emit(state.copyWith(
//         Exercises: newExercises,
//         getExerciseStatus: GetExerciseStatus.finish,
//       ));
//     } catch (e) {
//       emit(state.copyWith(
//         mess: e.toString(),
//         getExerciseStatus: GetExerciseStatus.error,
//       ));
//     }
//   }

//   Future<void> getExercisesWithMuscleGroup(DateTime date) async {
//     debugPrint("Date pass to function: $date");
//     emit(state.copyWith(
//       getExerciseStatus: GetExerciseStatus.getting,
//     ));
//     try {
//       final List<ExerciseModel> newExercises =
//           await _ExerciseDatabase.getSortedExercisesByDay(date);
//       emit(state.copyWith(
//         Exercises: newExercises,
//         getExerciseStatus: GetExerciseStatus.finish,
//       ));
//     } catch (e) {
//       emit(state.copyWith(
//         mess: e.toString(),
//         getExerciseStatus: GetExerciseStatus.error,
//       ));
//     }
//   }
// }
