import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:health_app_flutter/data/model/alarm_model.dart';
import 'package:health_app_flutter/util/date_time.dart';

class AlarmScheduler {
  DateTime scheduleForNextTime(
    DateTime alarmTime,
    RepeatOption repeatOption,
    List<int> customDays,
  ) {
    switch (repeatOption) {
      case RepeatOption.monFri:
        final newAlarmTime = alarmTime.add(const Duration(days: 1));
        if (newAlarmTime.weekday == DateTime.saturday ||
            newAlarmTime.weekday == DateTime.sunday) {
          return _nextWeekday(newAlarmTime, DateTime.monday);
        }
        debugPrint("qa alarm_scheduler: alarmTime reschedule $newAlarmTime");
        return newAlarmTime;
      case RepeatOption.custom:
        return _nextCustomDay(alarmTime, customDays);
      case RepeatOption.once:
      case RepeatOption.daily:
      default:
        return alarmTime.add(const Duration(days: 1));
    }
  }

  DateTime _nextWeekday(DateTime time, int weekday) {
    DateTime newTime = time;
    while (time.weekday >= DateTime.saturday) {
      newTime = time.add(Duration(days: 8 - time.weekday)); // Move to next Monday
    }
    return newTime;
  }

  DateTime _nextCustomDay(DateTime time, List<int> customDays) {
    DateTime newTime = time;
    newTime = newTime.add(const Duration(days: 1));
    while (!customDays.contains(newTime.weekday)) {
      newTime = newTime.add(const Duration(days: 1));
    }
    return newTime;
  }

  Future<bool> scheduleAlarm(AlarmModel alarm) async {
    try {
      return await Alarm.set(
        alarmSettings: AlarmSettings(
          id: alarm.id,
          dateTime: DateTimeHelper.stringToDatetimeFormat4(alarm.dateTime),
          loopAudio: alarm.loopAudio,
          assetAudioPath: alarm.audio, // Add your custom alarm sound here
          notificationTitle: alarm.title,
          notificationBody: alarm.note,
          vibrate: alarm.vibrate,
          volume: alarm.volume,
          enableNotificationOnKill: true,
        ),
      );
    } catch (e) {
      debugPrint("qa alarm_scheduler error: $e");
      return false;
    }
  }

  Future<bool> cancelAlarm(int id) async {
    return await Alarm.stop(id);
  }
}
