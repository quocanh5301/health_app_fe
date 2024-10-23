import 'dart:async';

import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_app_flutter/feature/alarm/ringing_alarm_screen.dart';
import 'package:health_app_flutter/feature/base/bloc/base_state.dart';
import 'package:health_app_flutter/util/router.dart';
import 'package:health_app_flutter/util/service/alarm_service.dart';
import 'package:health_app_flutter/util/service/permission.dart';

class BaseCubit extends Cubit<BaseState> {
  BaseCubit() : super(const BaseState());
  static StreamSubscription<AlarmSettings>? ringSubscription;

  void changeTab({required int index}) => emit(state.copyWith(tabIndex: index));

  void setUpAlarm() {
    NotificationPermissionsServices().requestPermission();
    if (Alarm.android) {
      ScheduleExactAlarmPermissionsServices().requestPermission();
    }
    ringSubscription ??= Alarm.ringStream.stream.listen(_navigateToRingScreen);
  }

  void disposeAlarm() {
    ringSubscription?.cancel();
  }

  Future<void> _navigateToRingScreen(
    AlarmSettings alarmSettings,
  ) async {
    if (rootNavigatorKey.currentContext != null && !state.isAlarmRinging) {
      emit(state.copyWith(isAlarmRinging: true));
      final AlarmService alarmService = AlarmService();
      // final alarmModel = await alarmService.getAlarmById(alarmSettings.id);
      // await alarmService.updateAlarm(alarmModel);
      await Navigator.push(
        rootNavigatorKey.currentContext!,
        MaterialPageRoute<void>(
          builder: (context) => RingingAlarmScreen(
            alarmSettings: alarmSettings,
            onSnooze: () {
              final now = DateTime.now();
              Alarm.set(
                alarmSettings: alarmSettings.copyWith(
                  dateTime: DateTime(
                    now.year,
                    now.month,
                    now.day,
                    now.hour,
                    now.minute,
                  ).add(const Duration(minutes: 1)),
                ),
              ).then((_) {
                if (context.mounted) Navigator.pop(context);
              });
            },
            onStop: () {
              Alarm.stop(alarmSettings.id).then(
                (_) {
                  alarmService.getAlarmById(alarmSettings.id).then(
                    (alarmModel) {
                      alarmService.updateAlarm(alarmModel);
                    },
                  );
                },
              ).then(
                (_) {
                  if (context.mounted) Navigator.pop(context);
                },
              );
            },
          ),
        ),
      );
      emit(state.copyWith(isAlarmRinging: false));
    }
  }
}
