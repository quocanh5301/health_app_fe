import 'package:dio/dio.dart';
import 'package:health_app_flutter/data/api/api.dart';
import 'package:health_app_flutter/data/api/end_point.dart';
import 'package:health_app_flutter/data/share_pref/shared_pref.dart';

class ExerciseDetailProvider {
  const ExerciseDetailProvider({required this.apiRequest});

  final APIRequest apiRequest;

  Future<Response> getExerciseDetail({
    required int exerciseId,
  }) async {
    return await apiRequest.post(
      endpoint: Endpoints.getExerciseDetail,
      data: {
        "userId": SharedPref.getUserInfo().id,
        'exerciseId': exerciseId,
      },
    );
  }

  Future<Response> markAsFavorite({
    required int exerciseId,
  }) async {
    return await apiRequest.post(
      endpoint: Endpoints.markAsFavoriteExercise,
      data: {
        "userId": SharedPref.getUserInfo().id,
        'exerciseId': exerciseId,
      },
    );
  }
}
