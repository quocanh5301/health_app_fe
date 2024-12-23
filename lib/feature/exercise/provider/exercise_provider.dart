import 'package:dio/dio.dart';
import 'package:health_app_flutter/data/api/api.dart';
import 'package:health_app_flutter/data/api/end_point.dart';

class ExerciseProvider {
  const ExerciseProvider({required this.apiRequest});

  final APIRequest apiRequest;
  final int pageSize = 10;

  // Future<Response> getAllExercise({
  //   required int page,
  // }) async {
  //   return await apiRequest.post(
  //     endpoint: Endpoints.getExercise,
  //     data: {
  //       'filterType': "all",
  //       'page': page,
  //       'pageSize': pageSize,
  //     },
  //   );
  // }

  Future<Response> getExerciseByFilter({
    required int page,
    required String filterType,
    required String filterValue,
  }) async {
    return await apiRequest.post(
      endpoint: Endpoints.getExercise,
      data: {
        'filterType': filterType,
        'filterValue': filterValue,
        'page': page,
        'pageSize': pageSize,
      },
    );
  }
}
