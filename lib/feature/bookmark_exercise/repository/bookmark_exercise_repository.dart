import 'package:fpdart/fpdart.dart';
import 'package:health_app_flutter/data/model/exercise_model.dart';
import 'package:health_app_flutter/feature/bookmark_exercise/provider/bookmark_exercise_provider.dart';

class BookmarkExerciseRepository {
  const BookmarkExerciseRepository({
    required this.bookmarkExerciseProvider,
  });

  final BookmarkExerciseProvider bookmarkExerciseProvider;

  TaskEither<String, List<ExerciseModel>> getBookmarkExercise({
    required int page,
  }) {
    return TaskEither.tryCatch(() async {
      final response = await bookmarkExerciseProvider.getBookmarkExercise(
        page: page,
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
        throw Exception(response.data['mess'] ?? 'getBookmarkExercise failed');
      }
    }, (error, stackTrace) => error.toString());
  }
}
