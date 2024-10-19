import 'package:freezed_annotation/freezed_annotation.dart';

part 'first_intro_state.freezed.dart';

@freezed
class FirstIntroState with _$FirstIntroState {
  const factory FirstIntroState({
    @Default(0) int tabIndex,
  }) = _FirstIntroState;
}
