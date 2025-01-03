import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_app_flutter/feature/alarm/bloc/alarm_list/alarm_cubit.dart';
import 'package:health_app_flutter/feature/alarm/bloc/alarm_list/alarm_state.dart';
import 'package:health_app_flutter/feature/alarm/widget/alarm_tile.dart';
import 'package:health_app_flutter/util/common_widget/overlay/my_overlay_controller.dart';
import 'package:health_app_flutter/util/date_time.dart';
import 'package:health_app_flutter/util/injection.dart';
import 'package:health_app_flutter/util/styles.dart';

class AlarmListScreen extends StatelessWidget {
  const AlarmListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AlarmCubit>(
      create: (context) => sl<AlarmCubit>()..getAllAlarm(),
      child: BlocBuilder<AlarmCubit, AlarmState>(
        buildWhen: (previous, current) =>
            previous.getAlarmStatus != current.getAlarmStatus,
        builder: (context, state) {
          return Scaffold(
            backgroundColor: "#1f2933".toColor(),
            appBar: AppBar(
              backgroundColor: Colors.grey.withOpacity(0.3),
              title: Text(
                'Your Reminders',
                style: AppStyles.f20m().copyWith(
                  color: Colors.white,
                ),
              ),
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.add_alarm_rounded,
                    color: Colors.white,
                    size: 33,
                  ),
                  onPressed: () => MyOverlayController.showEditAlarmBottomSheet(
                    context,
                    null,
                    (alarm) {
                      if (alarm != null) {
                        context.read<AlarmCubit>().setAlarm(alarm);
                      }
                      // return null; //!qa
                    },
                  ),
                ),
              ],
            ),
            body: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: state.alarms.isNotEmpty
                    ? ListView.separated(
                        itemCount: state.alarms.length,
                        separatorBuilder: (context, index) =>
                            const Divider(height: 1),
                        itemBuilder: (context, index) {
                          return AlarmTile(
                            key: ValueKey(state.alarms[index].id),
                            myKey: ValueKey(state.alarms[index].id),
                            alarmModel: state.alarms[index],
                            time: DateTimeHelper.format4StringToHHmmss(
                              state.alarms[index].dateTime,
                            ),
                            onPressed: () =>
                                MyOverlayController.showEditAlarmBottomSheet(
                              context,
                              state.alarms[index],
                              (alarm) {
                                if (alarm != null) {
                                  context.read<AlarmCubit>().updateAlarm(alarm);
                                }
                              },
                            ),
                            onDismissed: () {
                              context
                                  .read<AlarmCubit>()
                                  .deleteAlarm(state.alarms[index].id);
                              // Immediately remove the dismissed alarm from the list
                            },
                          );
                        },
                      )
                    : state.getAlarmStatus != GetAlarmStatus.getting
                        ? Center(
                            child: Text(
                              'No alarms set',
                              style: AppStyles.f18m().copyWith(
                                color: Colors.white,
                              ),
                            ),
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
                          ),
              ),
            ),
          );
        },
      ),
    );
  }
}
