import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:health_app_flutter/data/model/alarm_model.dart';

part 'alarm_edit_state.freezed.dart';

@freezed
class AlarmEditState with _$AlarmEditState {
  factory AlarmEditState({
    @Default(0) int id,
    @Default("") String title,
    @Default("") String note,
    @Default("") String dateTime, // Format: dd/MM/yyyy HH:mm:ss
    @Default(true) bool isActive,
    @Default(0.5) double volume,
    @Default(true) bool loopAudio,
    @Default(true) bool vibrate,
    @Default("assets/audio_nature_sounds.mp3") String audio,
    @Default(RepeatOption.once) RepeatOption repeatOption,
    @Default([]) List<int> customDays,
    @Default("") String mess,
  }) = _AlarmEditState;
}
