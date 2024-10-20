import 'package:flutter/material.dart';
import 'package:health_app_flutter/data/local_database/databases/alarm.dart';
import 'package:health_app_flutter/data/model/alarm_model.dart';
import 'package:health_app_flutter/util/alarm_scheduler.dart';
import 'package:health_app_flutter/util/date_time.dart';

class AlarmService {
  final AlarmDatabase _alarmDatabase = AlarmDatabase();
  final AlarmScheduler _alarmScheduler = AlarmScheduler();

  Future<AlarmModel> getAlarmById(int id) async {
    return await _alarmDatabase.getById(id) ?? AlarmModel();
  }

  Future<List<AlarmModel>> getAllAlarm() async {
    return await _alarmDatabase.getAll();
  }

  Future<bool> setAlarm(AlarmModel alarm) async {
    // Parse dateTime into DateTime object
    DateTime alarmTime;
    try {
      alarmTime = DateTimeHelper.stringToDatetimeFormat4(alarm.dateTime);
    } catch (e) {
      debugPrint("qa alarm_service error: alarmTime format error $e");
      return false;
    }

    // Adjust time if it's already passed
    DateTime finalAlarmTime = alarmTime;
    if (DateTime.now().isAfter(alarmTime) ||
        !alarm.customDays.contains(finalAlarmTime.weekday)) {
      finalAlarmTime = _alarmScheduler.scheduleForNextTime(
        alarmTime,
        alarm.repeatOption,
        alarm.customDays,
      );
    }

    alarm = alarm.copyWith(
      dateTime: DateTimeHelper.dateTimeToStringFormat4(finalAlarmTime),
    );

    if (await _alarmScheduler.scheduleAlarm(alarm)) {
      if (await _alarmDatabase.insert(alarm) != 0) {
        // Save alarm to the database
        return true;
      } else {
        await _alarmScheduler.cancelAlarm(alarm.id);
        return false;
      }
    } else {
      return false;
    }
  }

  Future<bool> toggleAlarm(AlarmModel alarm) async {
    if (alarm.isActive) {
      if (await _alarmScheduler.cancelAlarm(alarm.id)) {
        return true;
      } else {
        return false;
      }
    } else {
      if (await setAlarm(alarm)) {
        return true;
      } else {
        return false;
      }
    }
  }

  Future<bool> cancelAlarm(int id) async {
    return await _alarmScheduler.cancelAlarm(id);
  }

  Future<void> deleteAlarm(int id) async {
    if (await _alarmScheduler.cancelAlarm(id)) {
      await _alarmDatabase.delete(id.toString());
    }
  }

  Future<bool> checkIfAlarmExists(int id) async =>
      await _alarmDatabase.alarmExists(id);
}
