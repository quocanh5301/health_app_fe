import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_state.freezed.dart';

@freezed
class BaseState with _$BaseState {
  const factory BaseState({
    @Default(0) int tabIndex,
    @Default(false) bool isAlarmRinging,
  }) = _BaseState;
}
