import 'package:dio/dio.dart';

final apiRequest = Dio(
  BaseOptions(
    // baseUrl: 'https://tangoevent.vn/',
    connectTimeout: const Duration(minutes: 1),
    receiveTimeout: const Duration(minutes: 1),
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
      // debugPrint('ON ERROR $error');
      // if (error.response?.statusCode == 401 ||
      //     error.response?.data['code'] == 401) {
      //   apiRequest.post(
      //     Endpoints.refreshToken,
      //     data: {
      //       'refreshToken': SharedPref.getRefreshToken(),
      //       'userEmail': SharedPref.getUserInfo().userEmail,
      //     },
      //   ).then(
      //     (response) async {
      //       if (response.data['mess'] == 'success') {
      //         await SharedPref.setAccessToken(
      //             response.data['data']['accessToken']);
      //         await SharedPref.setRefreshToken(
      //             response.data['data']['refreshToken']);
      //         apiRequest.options.headers['Authorization'] =
      //             'Bearer ${response.data['data']['accessToken']}';
      //         handler.next(error); //!qa
      //       } else {
      //         final context = rootNavigatorKey.currentContext;
      //         if (context != null) {
      //           const LoginRoute().go(context);
      //         }
      //       }
      //     },
      //   );
      // }
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
