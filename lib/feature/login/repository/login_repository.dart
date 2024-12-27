import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:health_app_flutter/data/api/api.dart';
import 'package:health_app_flutter/data/model/user.dart';
import 'package:health_app_flutter/data/share_pref/shared_pref.dart';
import 'package:health_app_flutter/feature/login/provider/login_provider.dart';
// import 'package:tango/models/user/user.dart' as tango_user;

class LoginRepository {
  const LoginRepository({
    required this.loginProvider,
    // required this.firebaseMessaging,
  });

  // final FirebaseMessaging firebaseMessaging;
  final LoginProvider loginProvider;

  TaskEither<String, bool> login(
      {required String email, required String password}) {
    return TaskEither.tryCatch(() async {
      final response =
          await loginProvider.login(email: email, password: password);
      if (response.data['mess'] == 'Login successful') {
        String accessToken = response.data['data']['accessToken'];
        String refreshToken = response.data['data']['refreshToken'];
        try {
          // Verify a token (SecretKey for HMAC & PublicKey for all the others)

          JWT.verify(accessToken, SecretKey(Token.accessTokenSecret));
          SharedPref.setApiToken(accessToken);
          SharedPref.setRefreshToken(refreshToken);

          SharedPref.setUserInfo(
            User.fromJson(JWT.decode(accessToken).payload)
          );
          // registerFirebaseMessaging();
        } on JWTExpiredException {
          return false;
        } on JWTException catch (ex) {
          debugPrint(ex.message); // ex: invalid signature
          return false;
        }
        return true;
      } else {
        throw Exception(response.data['mess'] ?? 'Login failed');
      }
    }, (error, stackTrace) => error.toString());
  }
}
