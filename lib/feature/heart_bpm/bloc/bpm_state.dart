import 'package:freezed_annotation/freezed_annotation.dart';

part 'bpm_state.freezed.dart';

@freezed
class BPMState with _$BPMState {
  const factory BPMState({
    @Default('') String mess,
    @Default(200) int code,
    @Default(0) int bpm,
    @Default(0) int stressLevel,
    @Default('Basic Stress Level') String stressDescription,
    @Default(SetYouBPMStatus.initial) SetYouBPMStatus setYouBPMStatus,
  }) = _BPMState;
}

enum SetYouBPMStatus { initial, loading, success, failure }