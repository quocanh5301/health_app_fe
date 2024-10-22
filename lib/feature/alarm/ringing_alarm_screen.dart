// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'You alarm (${alarmSettings.id}) is ringing...',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Text('🔔', style: TextStyle(fontSize: 50)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RawMaterialButton(
                  onPressed: onSnooze,
                  child: Text(
                    'Snooze',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                RawMaterialButton(
                  onPressed: onStop,
                  child: Text(
                    'Stop',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
