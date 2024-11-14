import 'dart:async';

import 'package:flutter/material.dart';
import 'package:health_app_flutter/data/model/alarm_model.dart';
import 'package:health_app_flutter/feature/alarm/set_alarm_screen.dart';
import 'package:health_app_flutter/util/common_widget/overlay/overlay_widget/measure_option_dialog.dart';
import 'package:health_app_flutter/util/common_widget/overlay/overlay_widget/my_dialog.dart';
import 'package:health_app_flutter/util/common_widget/overlay/overlay_widget/time_picker.dart';

class MyOverlayController {
  static void showMyDialog<T>(
    BuildContext context,
    String title,
    String content,
    void Function() onConfirm,
    void Function() onDeny,
    FutureOr<void> Function(T?) onFinish,
  ) async {
    return showDialog<T>(
      context: context,
      barrierDismissible: false, // user must tap button to dismiss
      builder: (BuildContext context) {
        return MyDialog(
          title: title,
          content: content,
          onConfirm: onConfirm,
          onDeny: onDeny,
        );
      },
    ).then(onFinish);
  }

  static void showTimePickerDialog(
    BuildContext context,
    int initialHour,
    int initialMinute,
    int initialSecond,
    FutureOr<void> Function(String?) onFinish,
  ) async {
    return showDialog<String>(
      context: context,
      barrierDismissible: false, // user must tap button to dismiss
      builder: (BuildContext context) {
        return TimerPicker(
          selectedHour: initialHour,
          selectedMinute: initialMinute,
          selectedSecond: initialSecond,
        );
      },
    ).then(onFinish);
  }

  static void showEditAlarmBottomSheet(
    BuildContext context,
    AlarmModel? alarmModel,
    FutureOr<void> Function(AlarmModel?) onFinish,
  ) {
    showModalBottomSheet<AlarmModel>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(13),
          topRight: Radius.circular(13),
        ),
      ),
      backgroundColor: Colors.grey[800],
      builder: (context) {
        return SetAlarmScreen(
          alarmModel: alarmModel,
          context: context,
        );
      },
    ).then(onFinish);
  }

  static void showSetAlarmBottomSheet(
    BuildContext context,
    AlarmModel? alarmModel,
    FutureOr<void> Function(AlarmModel?) onFinish,
  ) {
    showModalBottomSheet<AlarmModel>(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.75,
          child: SetAlarmScreen(
            alarmModel: alarmModel,
            context: context,
          ),
        );
      },
    ).then(onFinish);
  }

  static void showMeasureOptionDialog(
    BuildContext context,
  ) async {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button to dismiss
      builder: (BuildContext context) {
        return const MeasureDialog();
      },
    );
  }
}
