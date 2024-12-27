import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_state.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState({
    @Default('') String email,
    @Default('') String password,
    @Default('') String name,
    @Default('') String errorMessage,
    @Default(RegisterStatus.initial) RegisterStatus registerStatus,
  }) = _RegisterState;
}

enum RegisterStatus { initial, loading, success, failure }
