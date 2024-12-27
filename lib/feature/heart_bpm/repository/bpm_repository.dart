import 'package:fpdart/fpdart.dart';
import 'package:health_app_flutter/feature/heart_bpm/provider/bpm_provider.dart';

class BPMRepository {
  const BPMRepository({
    required this.bpmProvider,
  });

  final BPMProvider bpmProvider;

  TaskEither<String, bool> saveBPMData({
    required int bpm,
    required int stressLevel,
  }) {
    return TaskEither.tryCatch(() async {
      final response = await bpmProvider.saveBPMData(
        heartRate: bpm,
        stressLevel: stressLevel,
      );
      if (response.data['mess'] == 'Heart rate data saved successfully') {
        try {
          // return list of last week run data
          return true;
        } catch (e) {
          throw Exception(e);
        }
      } else {
        throw Exception(response.data['mess'] ?? 'saveBPMData failed');
      }
    }, (error, stackTrace) => error.toString());
  }
}
