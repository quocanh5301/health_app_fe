import 'package:dio/dio.dart';
import 'package:health_app_flutter/data/api/api.dart';
import 'package:health_app_flutter/data/api/end_point.dart';

class LoginProvider {
  const LoginProvider({required this.apiRequest});

  final APIRequest apiRequest;

  Future<Response> login(
          {required String email, required String password}) async =>
      await apiRequest.post(
        endpoint: Endpoints.login,
        data: {
          'email': email,
          'password': password,
        },
      );
}
