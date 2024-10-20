import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_app_flutter/feature/alarm/ringing_alarm_screen.dart';
import 'package:health_app_flutter/feature/base/bloc/base_state.dart';
import 'package:health_app_flutter/util/router.dart';
import 'package:health_app_flutter/util/service/permission.dart';

class BaseCubit extends Cubit<BaseState> {
  BaseCubit() : super(const BaseState());

  void changeTab({required int index}) => emit(state.copyWith(tabIndex: index));

  void setUpAlarm() {
    NotificationPermissionsServices().requestPermission();
    if (Alarm.android) {
      ScheduleExactAlarmPermissionsServices().requestPermission();
    }
    Alarm.ringStream.stream.listen(navigateToRingScreen);
  }

  Future<void> navigateToRingScreen(
    AlarmSettings alarmSettings,
  ) async {
    if (rootNavigatorKey.currentContext != null) {
      await Navigator.push(
        rootNavigatorKey.currentContext!,
        MaterialPageRoute<void>(
          builder: (context) =>
              RingingAlarmScreen(alarmSettings: alarmSettings),
        ),
      );
    }
  }
}
