import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:health_app_flutter/data/model/alarm_model.dart';
import 'package:health_app_flutter/util/styles.dart';

class RepeatOptionDropDown extends StatefulWidget {
  final Function(RepeatOption?) onchange;
  final RepeatOption repeatOption;

  const RepeatOptionDropDown({
    super.key,
    required this.onchange,
    required this.repeatOption,
  });

  @override
  State<RepeatOptionDropDown> createState() => _MyDropDownState();
}

class _MyDropDownState extends State<RepeatOptionDropDown> {
  RepeatOption choosenOption = RepeatOption.once;
  final Map<RepeatOption, String> filter = {
    RepeatOption.once: "Once",
    RepeatOption.daily: "Daily",
    RepeatOption.monFri: "Mon to Fri",
    RepeatOption.custom: "Custom",
  };

  @override
  void initState() {
    choosenOption = widget.repeatOption;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<RepeatOption>(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: AppStyles.width(10),
          vertical: AppStyles.width(5),
        ),
        constraints: BoxConstraints.tight(
          Size.fromHeight(AppStyles.height(45)),
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.black,
            width: 5,
          ),
        ),
      ),
      isExpanded: true,
      value: choosenOption,
      onChanged: (value) {
        widget.onchange(value);
        setState(() {
          choosenOption = value!;
        });
      },
      dropdownStyleData: DropdownStyleData(
        maxHeight: AppStyles.height(200),
        offset: const Offset(0, -5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      menuItemStyleData: MenuItemStyleData(
        height: AppStyles.height(60),
        padding: EdgeInsets.only(left: AppStyles.width(15)),
      ),
      items: filter.entries
          .map<DropdownMenuItem<RepeatOption>>(
            (entry) => DropdownMenuItem<RepeatOption>(
              value: entry.key, // Use the audio path as the value
              alignment: AlignmentDirectional.centerStart,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    entry.value, // Display the audio label (e.g. "count down")
                    style: AppStyles.f14m().copyWith(
                      color: "#08357C".toColor(),
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
