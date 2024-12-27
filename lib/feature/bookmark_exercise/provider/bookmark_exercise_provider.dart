import 'package:dio/dio.dart';
import 'package:health_app_flutter/data/api/api.dart';
import 'package:health_app_flutter/data/api/end_point.dart';
import 'package:health_app_flutter/data/share_pref/shared_pref.dart';

class BookmarkExerciseProvider {
  const BookmarkExerciseProvider({required this.apiRequest});

  final APIRequest apiRequest;
  final int pageSize = 10;

  Future<Response> getBookmarkExercise({
    required int page,
  }) async {
    return await apiRequest.post(
      endpoint: Endpoints.getFavoriteExercise,
      data: {
        "userId": SharedPref.getUserInfo().id,
        'page': page,
        'pageSize': pageSize,
      },
    );
  }
}
