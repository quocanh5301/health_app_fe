import 'package:dio/dio.dart';
import 'package:health_app_flutter/data/api/api.dart';
import 'package:health_app_flutter/data/api/end_point.dart';

class RegisterProvider {
  const RegisterProvider({required this.apiRequest});

  final APIRequest apiRequest;

  Future<Response> register({
    required String email,
    required String password,
    required String name,
  }) async {
    return await apiRequest.post(
      endpoint: Endpoints.register,
      data: {
        'email': email,
        'password': password,
        'name': name,
      },
    );
  }
}
