import 'package:fpdart/fpdart.dart';
import 'package:health_app_flutter/feature/register/provider/register_provider.dart';

class RegisterRepository {
  const RegisterRepository({required this.registerProvider});

  final RegisterProvider registerProvider;

  TaskEither<String, bool> register({
    required String email,
    required String password,
    required String name,
  }) {
    return TaskEither.tryCatch(() async {
      final response = await registerProvider.register(
        email: email,
        password: password,
        name: name,
      );
      if (response.data['mess'] == 'success') {
        return true;
      } else {
        throw Exception(response.data['mess'] ?? 'Register failed');
      }
    }, (error, stackTrace) => error.toString());
  }
}
