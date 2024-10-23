import 'dart:async';

import 'package:flutter/material.dart';
import 'package:health_app_flutter/data/local_database/databases/alarm.dart';
import 'package:health_app_flutter/data/model/alarm_model.dart';
import 'package:health_app_flutter/util/alarm_scheduler.dart';
import 'package:health_app_flutter/util/date_time.dart';

class AlarmService {
  final AlarmDatabase _alarmDatabase = AlarmDatabase();
  final AlarmScheduler _alarmScheduler = AlarmScheduler();

  Future<AlarmModel> getAlarmById(int id) async {
    return await _alarmDatabase.getById(id) ?? const AlarmModel();
  }

  Future<List<AlarmModel>> getAllAlarm() async {
    // await _alarmDatabase.dropTable();
    final alarms = await _alarmDatabase.getAll();
    alarms.sort((a, b) {
      DateTime dateTimeA = DateTimeHelper.stringToDatetimeFormat5(
          DateTimeHelper.format4StringToHHmmss(a.dateTime));
      DateTime dateTimeB = DateTimeHelper.stringToDatetimeFormat5(
          DateTimeHelper.format4StringToHHmmss(b.dateTime));
      return dateTimeA.compareTo(dateTimeB); // Sort from low to high
    });
    return alarms;
  }

  Future<bool> toggleAlarm(AlarmModel alarm) async {
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
    if ((DateTime.now().isAfter(alarmTime) &&
            DateTime.now().weekday == alarmTime.weekday) ||
        (!alarm.customDays.contains(finalAlarmTime.weekday) &&
            alarm.repeatOption == RepeatOption.custom)) {
      finalAlarmTime = _alarmScheduler.scheduleForNextTime(
        alarmTime,
        alarm.repeatOption,
        alarm.customDays,
      );
    }

    alarm = alarm.copyWith(
      dateTime: DateTimeHelper.dateTimeToStringFormat4(finalAlarmTime),
      isActive: !alarm.isActive,
    );

    if (alarm.isActive) {
      if (await _alarmScheduler.scheduleAlarm(alarm)) {
        return await _alarmDatabase.update(alarm) > 0;
      } else {
        return false;
      }
    } else {
      if (await _alarmScheduler.cancelAlarm(alarm.id)) {
        return await _alarmDatabase.update(alarm) > 0;
      } else {
        return false;
      }
    }
  }

  Future<bool> cancelAlarm(int id) async {
    debugPrint("qa alarm_service: cancelAlarm $id");
    return await _alarmScheduler.cancelAlarm(id);
  }

  Future<bool> deleteAlarm(int id) async {
    if (await _alarmScheduler.cancelAlarm(id)) {
      return await _alarmDatabase.delete(id.toString()) > 0;
    } else {
      return false;
    }
  }

  Future<bool> checkIfAlarmExists(int id) async =>
      await _alarmDatabase.alarmExists(id);

  Future<bool> updateAlarm(AlarmModel alarm) async {
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
    if ((DateTime.now().isAfter(alarmTime) &&
            DateTime.now().weekday == alarmTime.weekday) ||
        (!alarm.customDays.contains(finalAlarmTime.weekday) &&
            alarm.repeatOption == RepeatOption.custom)) {
      finalAlarmTime = _alarmScheduler.scheduleForNextTime(
        alarmTime,
        alarm.repeatOption,
        alarm.customDays,
      );
      debugPrint("qa alarm_service: finalAlarmTime $finalAlarmTime");
    }

    alarm = alarm.copyWith(
      dateTime: DateTimeHelper.dateTimeToStringFormat4(finalAlarmTime),
    );

    if (alarm.isActive) {
      await _alarmScheduler.scheduleAlarm(alarm);
    } else {
      await _alarmScheduler.cancelAlarm(alarm.id);
    }

    return await _alarmDatabase.update(alarm) > 0;
  }

  Future<bool> insertAlarm(AlarmModel alarm) async {
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
    if ((DateTime.now().isAfter(alarmTime) &&
            DateTime.now().weekday == alarmTime.weekday) ||
        (!alarm.customDays.contains(finalAlarmTime.weekday) &&
            alarm.repeatOption == RepeatOption.custom)) {
      finalAlarmTime = _alarmScheduler.scheduleForNextTime(
        alarmTime,
        alarm.repeatOption,
        alarm.customDays,
      );
    }
    debugPrint("qa alarm_service: finalAlarmTime $finalAlarmTime");

    alarm = alarm.copyWith(
      dateTime: DateTimeHelper.dateTimeToStringFormat4(finalAlarmTime),
    );

    int id = await _alarmDatabase.insert(alarm);
    if (id != 0) {
      if (await _alarmScheduler.scheduleAlarm(alarm.copyWith(id: id))) {
        return true;
      } else {
        await _alarmScheduler.cancelAlarm(alarm.id);
        return false;
      }
    } else {
      return false;
    }
  }
}
