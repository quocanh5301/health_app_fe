import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:health_app_flutter/util/styles.dart';

class MyDropDown extends StatelessWidget {
  const MyDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> filter = [
      "S.of(context).allFilter",
      "S.of(context).speakerFilter",
      "S.of(context).typeFilter",
    ];
    String label = "S.of(context).filterBy";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: AppStyles.f15m().copyWith(
            color: Colors.white,
          ),
        ),
        const VerticalSpace(5),
        DropdownButtonFormField2(
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
          value: "S.of(context).allFilter",
          onChanged: (change) {},
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
          items: filter
              .map<DropdownMenuItem<String>>(
                  (String item) => DropdownMenuItem<String>(
                      value: item,
                      alignment: AlignmentDirectional.centerStart,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            item,
                            style: AppStyles.f14m().copyWith(
                              color: "#08357C".toColor(),
                            ),
                          ),
                        ],
                      )))
              .toList(),
        ),
      ],
    );
  }
}
