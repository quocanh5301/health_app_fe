import 'package:alarm/model/alarm_settings.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'alarm_state.freezed.dart';

@freezed
class AlarmState with _$AlarmState {
  const factory AlarmState({
    @Default([]) List<AlarmSettings> alarms,
    @Default("") String mess,
    @Default(SetAlarmStatus.initial) SetAlarmStatus setAlarmStatus,
    @Default(GetAlarmStatus.initial) GetAlarmStatus getAlarmStatus,
    @Default(DeleteAlarmStatus.initial) DeleteAlarmStatus deleteAlarmStatus,
  }) = _AlarmStatee;
}

enum SetAlarmStatus { initial, editting, finish, error }

enum GetAlarmStatus { initial, getting, finish, error }

enum DeleteAlarmStatus { initial, deleting, finish, error }