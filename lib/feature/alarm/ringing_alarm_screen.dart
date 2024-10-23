// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:health_app_flutter/feature/alarm/widget/slide_to_confirm.dart';
import 'package:health_app_flutter/util/styles.dart';

class RingingAlarmScreen extends StatelessWidget {
  const RingingAlarmScreen({
    super.key,
    required this.alarmSettings,
    required this.onSnooze,
    required this.onStop,
  });
  final AlarmSettings alarmSettings;
  final Function() onSnooze;
  final Function() onStop;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const VerticalSpace(50),
                  Text(
                    '🔔',
                    style: AppStyles.f20sb().copyWith(
                      fontSize: 100,
                    ),
                  ),
                  const VerticalSpace(25),
                  Text(
                    alarmSettings.notificationTitle,
                    style: AppStyles.f20sb(),
                  ),
                  const VerticalSpace(15),
                  Text(
                    alarmSettings.notificationBody,
                    style: AppStyles.f20sb(),
                  ),
                  const VerticalSpace(25),
                  InkWell(
                    onTap: onSnooze,
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: "#1f2933".toColor(),
                      ),
                      child: Text(
                        'Snooze',
                        style: AppStyles.f15sb().copyWith(
                          color: "e0e0e0".toColor(),
                        ),
                      ),
                    ),
                  ),
                  const VerticalSpace(25),
                  SlideToConfirm(
                    title: 'Slide to stop alarms',
                    onConfirm: onStop,
                  ),
                  const VerticalSpace(25),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
