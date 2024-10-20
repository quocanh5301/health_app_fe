import 'package:alarm/alarm.dart';
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
        alarmTime.add(const Duration(days: 1));
        if (alarmTime.weekday >= DateTime.saturday) {
          return _nextWeekday(alarmTime, DateTime.monday);
        }
        return alarmTime;
      case RepeatOption.custom:
        return _nextCustomDay(alarmTime, customDays);
      case RepeatOption.once:
      case RepeatOption.daily:
      default:
        return alarmTime.add(const Duration(days: 1));
    }
  }

  DateTime _nextWeekday(DateTime time, int weekday) {
    while (time.weekday >= DateTime.saturday) {
      time = time.add(Duration(days: 8 - time.weekday)); // Move to next Monday
    }
    return time;
  }

  DateTime _nextCustomDay(DateTime time, List<int> customDays) {
    while (!customDays.contains(time.weekday)) {
      time = time.add(const Duration(days: 1));
    }
    return time;
  }

  Future<bool> scheduleAlarm(AlarmModel alarm) async {
    return await Alarm.set(
      alarmSettings: AlarmSettings(
        id: alarm.id,
        dateTime: DateTimeHelper.stringToDatetimeFormat4(alarm.dateTime),
        loopAudio: alarm.loopAudio,
        assetAudioPath: alarm.audio, // Add your custom alarm sound here
        notificationTitle: alarm.title,
        notificationBody: alarm.note,
        vibrate: alarm.vibrate,
        volume: alarm.volumn,
        enableNotificationOnKill: true,
      ),
    );
  }

  Future<bool> cancelAlarm(int id) async {
    return await Alarm.stop(id);
  }
}
