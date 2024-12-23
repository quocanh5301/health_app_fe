import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_app_flutter/feature/exercise/bloc/exercise_list_cubit.dart';
import 'package:health_app_flutter/feature/exercise/bloc/exercise_list_state.dart';
import 'package:health_app_flutter/generated/l10n.dart';
import 'package:health_app_flutter/util/styles.dart';

class FilterTypeDropDown extends StatelessWidget {
  const FilterTypeDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, String> listUnit = {
      "all": S.of(context).allFilter,
      "muscle_group": S.of(context).muscleGroupFilter,
      "difficulty": S.of(context).difficultyFilter,
    };

    return BlocBuilder<ExerciseListCubit, ExerciseListState>(
      buildWhen: (previous, current) =>
          previous.filterType != current.filterType,
      builder: (context, state) {
        return DropdownButtonFormField2(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(
              AppStyles.width(10),
              AppStyles.height(5),
              AppStyles.width(10),
              AppStyles.height(5),
            ),
            filled: true,
            fillColor: '#2b2b2b'.toColor(),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Colors.black,
                width: 5,
              ),
            ),
            hintStyle: AppStyles.f15m().copyWith(
              color: '#FF6B00'.toColor(),
            ),
          ),
          isExpanded: true,
          value: state.filterType,
          onChanged: (item) => context
              .read<ExerciseListCubit>()
              .setFilterType(item as String),
          dropdownStyleData: DropdownStyleData(
            maxHeight: AppStyles.height(200),
            offset: const Offset(0, -5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: '#2b2b2b'.toColor(),
            ),
          ),
          menuItemStyleData: MenuItemStyleData(
            height: AppStyles.height(60),
            padding: EdgeInsets.only(
              left: AppStyles.width(15),
            ),
          ),
          iconStyleData: IconStyleData(
            openMenuIcon: Icon(
              Icons.arrow_drop_down,
              color: '#FF6B00'.toColor(),
            ),
          ),
          items: listUnit.entries
              .map<DropdownMenuItem<String>>(
                (MapEntry<String, String> unit) =>
                    DropdownMenuItem<String>(
                  value: unit.key,
                  alignment: AlignmentDirectional.centerStart,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        unit.value,
                        style: AppStyles.f12m().copyWith(
                          color: '#FF6B00'.toColor(),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        );
      },
    );
  }
}
