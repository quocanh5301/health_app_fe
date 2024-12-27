import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:health_app_flutter/data/api/api.dart';
import 'package:health_app_flutter/data/api/end_point.dart';
import 'package:health_app_flutter/data/model/basic_heart_rate_data.dart';
import 'package:health_app_flutter/data/model/basic_run_data.dart';
import 'package:health_app_flutter/data/share_pref/shared_pref.dart';

class HomeProvider {
  const HomeProvider({required this.apiRequest});

  final APIRequest apiRequest;

  Future<Response> getRunDataForCurrentAndPreviousWeek({
    required int userId,
  }) async =>
      await apiRequest.post(
        endpoint: Endpoints.getRunDataForCurrentAndPreviousWeek,
        data: {
          'userId': userId,
        },
      );

  Future<Response> getHeartRateDataForLast7Days({
    required int userId,
  }) async =>
      await apiRequest.post(
        endpoint: Endpoints.getHeartRateDataForLast7Days,
        data: {
          'userId': userId,
        },
      );
}

class HomeRepository {
  const HomeRepository({
    required this.homeProvider,
  });

  final HomeProvider homeProvider;

  TaskEither<String, Map<String, List<BasicRunData>>> getMyRunData() {
    return TaskEither.tryCatch(() async {
      final response = await homeProvider.getRunDataForCurrentAndPreviousWeek(
        userId: SharedPref.getUserInfo().id ?? 0,
      );
      // debugPrint('getMyRunData response: ${response}');
      if (response.data['mess'] == 'Success') {
        try {
          // return list of last week run data
          return {
            "previous": (response.data['data']['previousWeek'] as List)
                .map((item) => BasicRunData.fromJson(item))
                .toList(),
            "current": (response.data['data']['currentWeek'] as List)
                .map((item) => BasicRunData.fromJson(item))
                .toList()
          };
        } catch (e) {
          throw Exception(e);
        }
      } else {
        throw Exception(response.data['mess'] ?? 'getUserSearchResult failed');
      }
    }, (error, stackTrace) => error.toString());
  }

  TaskEither<String, List<BasicHeartRateData>?> getMyHeartRate() {
    return TaskEither.tryCatch(() async {
      final response = await homeProvider.getHeartRateDataForLast7Days(
        userId: SharedPref.getUserInfo().id ?? 0,
      );
      // debugPrint('getMyRunData response: ${response}');
      if (response.data['mess'] == 'Success') {
        try {
          // return list of last week run data
          return (response.data['data'] as List)
                .map((item) => BasicHeartRateData.fromJson(item))
                .toList();
        } catch (e) {
          throw Exception(e);
        }
      } else {
        throw Exception(response.data['mess'] ?? 'getMyHeartRate failed');
      }
    }, (error, stackTrace) => error.toString());
  }

}
