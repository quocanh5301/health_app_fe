import 'package:fpdart/fpdart.dart';
import 'package:health_app_flutter/data/model/exercise_model.dart';
import 'package:health_app_flutter/feature/exercise/provider/exercise_provider.dart';

class ExerciseRepository {
  const ExerciseRepository({
    required this.exerciseProvider,
  });

  final ExerciseProvider exerciseProvider;

  // TaskEither<String, List<ExerciseModel>> getAllExercise({
  //   required int page,
  // }) {
  //   return TaskEither.tryCatch(() async {
  //     final response = await exerciseProvider.getAllExercise(
  //       page: page,
  //     );
  //     // debugPrint('getMyRunData response: ${response}');
  //     if (response.data['mess'] == 'Success') {
  //       try {
  //         // return list of last week run data
  //         return (response.data['data'] as List)
  //             .map((item) => ExerciseModel.fromJson(item))
  //             .toList();
  //       } catch (e) {
  //         debugPrint('error: $e');
  //         throw Exception(e);
  //       }
  //     } else {
  //       throw Exception(response.data['mess'] ?? 'getAllExercise failed');
  //     }
  //   }, (error, stackTrace) => error.toString());
  // }

  TaskEither<String, List<ExerciseModel>> getExerciseByFilter({
    required int page,
    required String filterType,
    required String filterValue,
  }) {
    return TaskEither.tryCatch(() async {
      final response = await exerciseProvider.getExerciseByFilter(
        page: page,
        filterType: filterType,
        filterValue: filterValue,
      );
      // debugPrint('getMyRunData response: ${response}');
      if (response.data['mess'] == 'Success') {
        try {
          // return list of last week run data
          return (response.data['data'] as List)
              .map((item) => ExerciseModel.fromJson(item))
              .toList();
        } catch (e) {
          throw Exception(e);
        }
      } else {
        throw Exception(response.data['mess'] ?? 'getExerciseByFilter failed');
      }
    }, (error, stackTrace) => error.toString());
  }
}
