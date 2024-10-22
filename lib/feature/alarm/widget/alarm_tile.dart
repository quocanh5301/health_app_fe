import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_app_flutter/data/model/alarm_model.dart';
import 'package:health_app_flutter/feature/alarm/bloc/alarm_list/alarm_cubit.dart';

class AlarmTile extends StatelessWidget {
  const AlarmTile({
    required this.title,
    required this.onPressed,
    super.key,
    this.onDismissed,
    required this.alarmModel,
    required this.myKey,
  });

  final String title;
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
          height: 100,
          padding: const EdgeInsets.all(35),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                ),
              ),
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
