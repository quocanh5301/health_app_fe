import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:health_app_flutter/data/model/alarm_model.dart';

part 'alarm_state.freezed.dart';

@freezed
class AlarmState with _$AlarmState {
  const factory AlarmState({
    @Default([]) List<AlarmModel> alarms,
    @Default("") String mess,
    @Default(GetAlarmStatus.initial) GetAlarmStatus getAlarmStatus,
    @Default(DeleteAlarmStatus.initial) DeleteAlarmStatus deleteAlarmStatus,
    @Default(SetAlarmStatus.initial) SetAlarmStatus setAlarmStatus,
  }) = _AlarmState;
}

enum SetAlarmStatus { initial, setting, finish, error }

enum GetAlarmStatus { initial, getting, finish, error }

enum DeleteAlarmStatus { initial, deleting, finish, error }
