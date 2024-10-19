// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:health_app_flutter/util/styles.dart';

class TimerPicker extends StatefulWidget {
  final int selectedHour;
  final int selectedMinute;
  final int selectedSecond;
  final Function(int hour) onHourSelected;
  final Function(int minute) onMinuteSelected;
  final Function(int second) onSecondSelected;
  const TimerPicker({
    super.key,
    required this.selectedHour,
    required this.selectedMinute,
    required this.selectedSecond,
    required this.onHourSelected,
    required this.onMinuteSelected,
    required this.onSecondSelected,
  });

  @override
  State<TimerPicker> createState() => _TimerPickerScreenState();
}

class _TimerPickerScreenState extends State<TimerPicker> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // mainAxisSize: MainAxisSize.min,
          children: [
            buildListWheelPicker(
              context: context,
              itemCount: 24,
              selectedValue: widget.selectedHour,
              onSelectedItemChanged: (value) {
                widget.onHourSelected(value);
              },
            ),
            buildListWheelPicker(
              context: context,
              itemCount: 60,
              selectedValue: widget.selectedMinute,
              onSelectedItemChanged: (value) {
                widget.onMinuteSelected(value);
              },
            ),
            buildListWheelPicker(
              context: context,
              itemCount: 60,
              selectedValue: widget.selectedSecond,
              onSelectedItemChanged: (value) {
                widget.onSecondSelected(value);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildListWheelPicker({
    required BuildContext context,
    required int itemCount,
    required int selectedValue,
    required ValueChanged<int> onSelectedItemChanged,
  }) {
    final fixedExtentScrollController =
        FixedExtentScrollController(initialItem: selectedValue);
    return SizedBox(
      height: AppStyles.height(400),
      width: AppStyles.width(100),
      child: ListWheelScrollView.useDelegate(
        itemExtent: AppStyles.height(50),
        controller: fixedExtentScrollController,
        physics: const FixedExtentScrollPhysics(),
        onSelectedItemChanged: onSelectedItemChanged,
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (context, index) {
            return Opacity(
              opacity: calculateOpacity(
                  index, fixedExtentScrollController.selectedItem),
              child: Center(
                child: Text(
                  index.toString().padLeft(2, '0'),
                  style: AppStyles.f20sb().copyWith(fontSize: 30),
                ),
              ),
            );
          },
          childCount: itemCount,
        ),
      ),
    );
  }

  double calculateOpacity(int index, int selectedValue) {
    if (index == selectedValue) {
      return 1;
    } else if (index == selectedValue - 1 || index == selectedValue + 1) {
      return 0.7;
    } else if (index == selectedValue - 2 || index == selectedValue + 2) {
      return 0.5;
    } else if (index == selectedValue - 3 || index == selectedValue + 3) {
      return 0.3;
    } else {
      return 0.1;
    }
  }
}
