import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_app_flutter/data/model/alarm_model.dart';
import 'package:health_app_flutter/feature/alarm/bloc/alarm_list/alarm_cubit.dart';
import 'package:health_app_flutter/util/styles.dart';

class AlarmTile extends StatelessWidget {
  const AlarmTile({
    required this.time,
    required this.onPressed,
    super.key,
    this.onDismissed,
    required this.alarmModel,
    required this.myKey,
  });

  final String time;
  final AlarmModel alarmModel;
  final void Function() onPressed;
  final void Function()? onDismissed;
  final Key myKey;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: myKey,
      direction: onDismissed != null
          ? DismissDirection.endToStart
          : DismissDirection.none,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 30),
        child: const Icon(
          Icons.delete,
          size: 30,
          color: Colors.white,
        ),
      ),
      onDismissed: (_) => onDismissed?.call(),
      child: RawMaterialButton(
        onPressed: onPressed,
        child: Container(
          // height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white.withOpacity(0.3),
          ),
          padding: const EdgeInsets.all(35),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            alarmModel.title,
                            style: AppStyles.f18sb().copyWith(
                              color: Colors.white,
                            ),
                          ),
                          const HorizontalSpace(10),
                          Text(
                            time,
                            style: AppStyles.f17m().copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const VerticalSpace(10),
                      Expanded(
                        child: Text(
                          alarmModel.note,
                          textAlign: TextAlign.start,
                          style: AppStyles.f17m().copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const HorizontalSpace(10),
              Switch(
                value: alarmModel.isActive,
                onChanged: (value) => context.read<AlarmCubit>().toggleAlarm(
                      alarmModel,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
