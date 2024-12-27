import 'package:dio/dio.dart';
import 'package:health_app_flutter/data/api/api.dart';
import 'package:health_app_flutter/data/api/end_point.dart';
import 'package:health_app_flutter/data/share_pref/shared_pref.dart';
import 'package:intl/intl.dart';

//date time format in "2024-11-28 13:12:00"

class BPMProvider {
  const BPMProvider({required this.apiRequest});

  final APIRequest apiRequest;

  Future<Response> saveBPMData({
    required int heartRate,
    required int stressLevel,
  }) async =>
      await apiRequest.post(
        endpoint: Endpoints.saveHeartRateData,
        data: {
          'userId': SharedPref.getUserInfo().id,
          'measuredAt': DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
          'heartRate': heartRate,
          'stressLevel': stressLevel,
        },
      );
}
