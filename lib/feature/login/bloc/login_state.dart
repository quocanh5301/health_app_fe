import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState({
    @Default('') String email,
    @Default('') String password,
    @Default('') String errorMessage,
    @Default(LoginStatus.initial) LoginStatus loginStatus,
  }) = _LoginState;
}

enum LoginStatus { initial, loading, success, failure }
