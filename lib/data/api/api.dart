import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:health_app_flutter/data/api/end_point.dart';
import 'package:health_app_flutter/data/share_pref/shared_pref.dart';
import 'package:health_app_flutter/util/router.dart';

final apiRequest = Dio(
  BaseOptions(
    baseUrl: 'http://192.168.200.1:3000/',
    connectTimeout: const Duration(minutes: 1),
    receiveTimeout: const Duration(minutes: 1),
    headers: {
      'Authorization': 'Bearer ${SharedPref.getApiToken()}',
    },
  ),
);

class Token {
  //! run flutter run --dart-define=accessTokenSecret=mygfisinanothernationimaginationhaha --dart-define=refreshTokenSecret=mylifeisafuckingjokeplshelpwtf
  static String accessTokenSecret = 'mygfisinanothernationimaginationhaha';
  static String refreshTokenSecret = 'mylifeisafuckingjokeplshelpwtf';
  //! usage:
  //! const accessTokenSecret = String.fromEnvironment('accessTokenSecret', defaultValue: 'i don't know :P');
  //! const refreshTokenSecret = String.fromEnvironment('refreshTokenSecret', defaultValue: 'get out please');
}

void configInterceptor(Dio apiRequest) {
  final interceptor = InterceptorsWrapper(
    onRequest: (options, handler) {
      // debugPrint('ON REQUEST PATH ${options.path}');
      // debugPrint('ON REQUEST DATA ${options.data.toString()}');
      // debugPrint('ON REQUEST EXTRA ${options.extra}');
      // debugPrint('ON REQUEST METHOD ${options.method}');
      // debugPrint('ON REQUEST HEADER ${options.headers}');
      return handler.next(options);
    },
    onResponse: (response, handler) {
      // debugPrint('ON RESPONSE $response');
      return handler.next(response);
    },
    onError: (error, handler) {
      debugPrint('ON ERROR $error');
      if (error.response?.statusCode == 401 ||
          error.response?.data['code'] == 401) {
        apiRequest.post(
          Endpoints.refreshToken,
          data: {
            'refreshToken': SharedPref.getRefreshToken(),
            'userId': SharedPref.getUserInfo().id,
          },
        ).then(
          (response) async {
            if (response.data['mess'] == 'success') {
              await SharedPref.setApiToken(
                  response.data['data']['accessToken']);
              await SharedPref.setRefreshToken(
                  response.data['data']['refreshToken']);
              apiRequest.options.headers['Authorization'] =
                  'Bearer ${response.data['data']['accessToken']}';
              // handler.next(error); //!qa
              handler.resolve(response);
            } else {
              final context = rootNavigatorKey.currentContext;
              if (context != null) {
                const LoginRoute().go(context);
              }
            }
          },
        );
      }
      return handler.next(error);
    },
  );

  apiRequest.interceptors.clear();
  if (!apiRequest.interceptors
      .any((interceptor) => interceptor is InterceptorsWrapper)) {
    // debugPrint('INTERCEPTOR ADDED');
    apiRequest.interceptors.clear();
    apiRequest.interceptors.add(interceptor);
  }
}

class APIRequest {
  APIRequest() {
    configInterceptor(apiRequest);
  }

  Future<Response> get({
    required String endpoint,
    Object? data,
  }) =>
      apiRequest.get(
        endpoint,
        data: data,
      );

  Future<Response> post({
    required String endpoint,
    Object? data,
  }) =>
      apiRequest.post(
        endpoint,
        data: data,
      );
}
