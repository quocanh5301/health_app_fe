import 'package:fpdart/fpdart.dart';
import 'package:health_app_flutter/data/model/exercise_detail_model.dart';
import 'package:health_app_flutter/feature/exercise_detail.dart/provider/exercise_detail_provider.dart';

class ExerciseDetailRepository {
  const ExerciseDetailRepository({
    required this.exerciseDetailProvider,
  });

  final ExerciseDetailProvider exerciseDetailProvider;

  TaskEither<String, ExerciseDetailModel> getExerciseDetail({
    required int exerciseId,
  }) {
    return TaskEither.tryCatch(() async {
      final response = await exerciseDetailProvider.getExerciseDetail(
          exerciseId: exerciseId);
      // debugPrint('getMyRunData response: ${response}');
      if (response.data['mess'] == 'Success') {
        try {
          // return list of last week run data
          return ExerciseDetailModel.fromJson(response.data['data']);
        } catch (e) {
          throw Exception(e);
        }
      } else {
        throw Exception(response.data['mess'] ?? 'getExerciseByFilter failed');
      }
    }, (error, stackTrace) => error.toString());
  }

  TaskEither<String, bool> markAsFavorite({
    required int exerciseId,
  }) {
    return TaskEither.tryCatch(() async {
      final response =
          await exerciseDetailProvider.markAsFavorite(exerciseId: exerciseId);
      // debugPrint('getMyRunData response: ${response}');
      if (response.data['mess'] == 'Success') {
        return true;
      } else {
        throw Exception(response.data['mess'] ?? 'markAsFavorite failed');
      }
    }, (error, stackTrace) => error.toString());
  }
}
