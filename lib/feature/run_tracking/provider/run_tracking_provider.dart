import 'package:dio/dio.dart';
import 'package:health_app_flutter/data/api/api.dart';
import 'package:health_app_flutter/data/api/end_point.dart';
import 'package:health_app_flutter/data/share_pref/shared_pref.dart';
import 'package:intl/intl.dart';

class RunTrackingProvider {
  const RunTrackingProvider({required this.apiRequest});

  final APIRequest apiRequest;

  Future<Response> saveRunData({
    required double distance,
    required int stepsCount,
    required int duration, // in seconds
  }) async {
    return await apiRequest.post(
      endpoint: Endpoints.saveRunData,
      data: {
        'userId': SharedPref.getUserInfo().id,
        'runDate': DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
        'distance': distance,
        'stepsCount': stepsCount,
        'duration': duration,
      },
    );
  }
}
