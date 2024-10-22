// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:health_app_flutter/util/date_time.dart';

import 'package:health_app_flutter/util/styles.dart';

class TimerPicker extends StatefulWidget {
  final int selectedHour;
  final int selectedMinute;
  final int selectedSecond;
  const TimerPicker({
    super.key,
    required this.selectedHour,
    required this.selectedMinute,
    required this.selectedSecond,
  });

  @override
  State<TimerPicker> createState() => _TimerPickerScreenState();
}

class _TimerPickerScreenState extends State<TimerPicker> {
  int hour = 0;
  int minute = 0;
  int second = 0;

  @override
  void initState() {
    hour = widget.selectedHour;
    minute = widget.selectedMinute;
    second = widget.selectedSecond;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      buildListWheelPicker(
                        context: context,
                        itemCount: 24,
                        selectedValue: hour,
                        onSelectedItemChanged: (value) {
                          setState(() {
                            hour = value;
                          });
                        },
                      ),
                      buildListWheelPicker(
                        context: context,
                        itemCount: 60,
                        selectedValue: minute,
                        onSelectedItemChanged: (value) {
                          setState(() {
                            minute = value;
                          });
                        },
                      ),
                      buildListWheelPicker(
                        context: context,
                        itemCount: 60,
                        selectedValue: second,
                        onSelectedItemChanged: (value) {
                          setState(() {
                            second = value;
                          });
                        },
                      ),
                    ],
                  ),
                  const VerticalSpace(10),
                  InkWell(
                    onTap: () {
                      try {
                        String timeString =
                            DateTimeHelper.getTimeStringFromInts(
                          hour,
                          minute,
                          second,
                        );
                        Navigator.of(context).pop(timeString);
                      } catch (e) {
                        Navigator.of(context).pop(null);
                      }
                    },
                    child: Container(
                      height: AppStyles.height(40),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: '#08357C'.toColor(),
                      ),
                      child: Center(
                        child: Text(
                          "S.of(context).",
                          style:
                              AppStyles.f15sb().copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Positioned(
                top: 3,
                right: 3,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(null),
                ),
              ),
            ],
          ),
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
      width: AppStyles.width(80),
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
                  style: AppStyles.f20sb().copyWith(fontSize: 25),
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
