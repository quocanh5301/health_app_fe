import 'package:fpdart/fpdart.dart';
import 'package:health_app_flutter/feature/run_tracking/provider/run_tracking_provider.dart';

class RunTrackingRepository {
  const RunTrackingRepository({
    required this.runTrackingProvider,
  });

  final RunTrackingProvider runTrackingProvider;

  TaskEither<String, bool> saveRunData({
    required double distance,
    required int stepsCount,
    required int duration, // in seconds
  }) {
    return TaskEither.tryCatch(() async {
      final response = await runTrackingProvider.saveRunData(
        distance: distance,
        stepsCount: stepsCount,
        duration: duration,
      );
      if (response.data['mess'] == 'Run data saved successfully') {
        try {
          // return list of last week run data
          return true;
        } catch (e) {
          throw Exception(e);
        }
      } else {
        throw Exception(response.data['mess'] ?? 'saveRunData failed');
      }
    }, (error, stackTrace) => error.toString());
  }
}
