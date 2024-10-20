import 'package:freezed_annotation/freezed_annotation.dart';

part 'alarm_model.freezed.dart';
part 'alarm_model.g.dart';

@freezed
class AlarmModel with _$AlarmModel {
  factory AlarmModel({
    @Default(0) int id,
    @Default("") String title,
    @Default("") String note,
    @Default("") String dateTime, // Format: dd/MM/yyyy HH:mm:ss
    @Default(true) bool isActive,
    @Default(0.5) double volumn,
    @Default(true) bool loopAudio,
    @Default(true) bool vibrate,
    @Default("assets/audio_nature_sounds.mp3") String audio,
    @Default(RepeatOption.once) RepeatOption repeatOption,
    @Default([]) List<int> customDays, // 1 means Monday, 6 means Saturday, 7 means Sunday
  }) = _AlarmModel;

  factory AlarmModel.fromJson(Map<String, dynamic> json) =>
      _$AlarmModelFromJson(json);
}

enum RepeatOption { daily, monFri, once, custom }
