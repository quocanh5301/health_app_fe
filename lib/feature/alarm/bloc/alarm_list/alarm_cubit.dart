import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_app_flutter/data/model/alarm_model.dart';
import 'package:health_app_flutter/feature/alarm/bloc/alarm_list/alarm_state.dart';
import 'package:health_app_flutter/util/date_time.dart';
import 'package:health_app_flutter/util/service/alarm_service.dart';

class AlarmCubit extends Cubit<AlarmState> {
  AlarmCubit(this.alarmService) : super(const AlarmState());
  final AlarmService alarmService;

  Future<void> getAllAlarm() async {
    emit(state.copyWith(
      getAlarmStatus: GetAlarmStatus.getting,
    ));
    try {
      final alarms = await alarmService.getAllAlarm();
      alarms.sort((a, b) {
        DateTime dateTimeA = DateTimeHelper.stringToDatetimeFormat4(a.dateTime);
        DateTime dateTimeB = DateTimeHelper.stringToDatetimeFormat4(b.dateTime);

        return dateTimeA.compareTo(dateTimeB); // Sort from low to high
      });
      emit(state.copyWith(
        alarms: alarms,
        getAlarmStatus: GetAlarmStatus.finish,
      ));
    } catch (e) {
      emit(state.copyWith(
        mess: e.toString(),
        getAlarmStatus: GetAlarmStatus.error,
      ));
    }
  }

  Future<void> deleteAlarm(int id) async {
    emit(state.copyWith(
      deleteAlarmStatus: DeleteAlarmStatus.deleting,
    ));
    try {
      alarmService.deleteAlarm(id);
      emit(state.copyWith(
        alarms: state.alarms.where((element) => element.id != id).toList(),
        deleteAlarmStatus: DeleteAlarmStatus.finish,
      ));
    } catch (e) {
      emit(state.copyWith(
        mess: e.toString(),
        deleteAlarmStatus: DeleteAlarmStatus.error,
      ));
    }
  }

  Future<void> setAlarm(AlarmModel alarmModel) async {
    emit(state.copyWith(
      setAlarmStatus: SetAlarmStatus.setting,
    ));
    try {
      if (await alarmService.insertAlarm(alarmModel)) {
        emit(
          state.copyWith(
            setAlarmStatus: SetAlarmStatus.finish,
          ),
        );
      } else {
        emit(
          state.copyWith(
            setAlarmStatus: SetAlarmStatus.error,
          ),
        );
      }
    } catch (e) {
      emit(state.copyWith(
        mess: e.toString(),
        setAlarmStatus: SetAlarmStatus.error,
      ));
    }
    await getAllAlarm();
  }

  Future<void> toggleAlarm(AlarmModel alarmModel) async {
    emit(state.copyWith(
      setAlarmStatus: SetAlarmStatus.setting,
    ));
    try {
      if (await alarmService.toggleAlarm(alarmModel)) {
        emit(state.copyWith(setAlarmStatus: SetAlarmStatus.finish));
      } else {
        emit(state.copyWith(
          mess: "Failed to cancel alarm",
          setAlarmStatus: SetAlarmStatus.error,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        mess: e.toString(),
        setAlarmStatus: SetAlarmStatus.error,
      ));
    }
    await getAllAlarm();
  }

  Future<void> updateAlarm(AlarmModel alarmModel) async {
    emit(state.copyWith(
      setAlarmStatus: SetAlarmStatus.setting,
    ));
    try {
      if (await alarmService.updateAlarm(alarmModel)) {
        emit(state.copyWith(
          setAlarmStatus: SetAlarmStatus.finish,
        ));
      } else {
        emit(state.copyWith(
          mess: "Failed to update alarm",
          setAlarmStatus: SetAlarmStatus.error,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        mess: e.toString(),
        setAlarmStatus: SetAlarmStatus.error,
      ));
    }
    await getAllAlarm();
  }
}
