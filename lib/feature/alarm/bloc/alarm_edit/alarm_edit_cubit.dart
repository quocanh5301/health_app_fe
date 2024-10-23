import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_app_flutter/data/model/alarm_model.dart';
import 'package:health_app_flutter/feature/alarm/bloc/alarm_edit/alarm_edit_state.dart';
import 'package:health_app_flutter/util/service/alarm_service.dart';

class AlarmEditCubit extends Cubit<AlarmEditState> {
  AlarmEditCubit(this.alarmService) : super(AlarmEditState());
  final AlarmService alarmService;

  void setAlarmTitle(String title) => emit(state.copyWith(title: title));

  void setAlarmNote(String note) => emit(state.copyWith(note: note));

  void setAlarmDateTime(String dateTime) =>
      emit(state.copyWith(dateTime: dateTime));

  void setAlarmIsActive(bool isActive) =>
      emit(state.copyWith(isActive: isActive));

  void setAlarmVolume(double volume) => emit(state.copyWith(volume: volume));

  void setAlarmLoopAudio(bool loopAudio) =>
      emit(state.copyWith(loopAudio: loopAudio));

  void setAlarmVibrate(bool vibrate) => emit(state.copyWith(vibrate: vibrate));

  void setAlarmAudio(String audio) => emit(state.copyWith(audio: audio));

  void setAlarmRepeatOption(RepeatOption repeatOption) =>
      emit(state.copyWith(repeatOption: repeatOption));

  void setAlarmCustomDays(List<int> customDays) =>
      emit(state.copyWith(customDays: customDays));

  // Future<void> saveAlarm() async {
  // final alarm = AlarmModel(
  //   id: state.id,
  //   title: state.title,
  //   note: state.note,
  //   dateTime: state.dateTime,
  //   isActive: state.isActive,
  //   volume: state.volume,
  //   loopAudio: state.loopAudio,
  //   vibrate: state.vibrate,
  //   audio: state.audio,
  //   repeatOption: state.repeatOption,
  //   customDays: state.customDays,
  // );

  //   try {
  //     await alarmService.setAlarm(alarm);
  //   } catch (e) {
  //     emit(state.copyWith(mess: e.toString()));
  //   }
  // }
}
