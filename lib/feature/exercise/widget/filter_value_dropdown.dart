import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_app_flutter/feature/exercise/bloc/exercise_list_cubit.dart';
import 'package:health_app_flutter/feature/exercise/bloc/exercise_list_state.dart';
import 'package:health_app_flutter/generated/l10n.dart';
import 'package:health_app_flutter/util/styles.dart';

class FilterValueDropDown extends StatelessWidget {
  const FilterValueDropDown({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, String> filterDifficultyList = {
      "beginner": S.of(context).beginner,
      "intermediate": S.of(context).intermediate,
      "advance": S.of(context).advance,
    };

    Map<String, String> filterMuscleList = {
      "chest": S.of(context).chest,
      "upper_back": S.of(context).upperBack,
      "lower_back": S.of(context).lowerBack,
      "shoulders": S.of(context).shoulders,
      "biceps": S.of(context).biceps,
      "triceps": S.of(context).triceps,
      "forearms": S.of(context).forarms,
      "core": S.of(context).core,
      "calves": S.of(context).calves,
      "thighs": S.of(context).thighs,
      "glutes": S.of(context).glutes,
      "full_body": S.of(context).fullBody,
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
          value: state.filterValue,
          onChanged: (item) =>
              context.read<ExerciseListCubit>().setFilterValue(item as String),
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
          items: (state.filterType == "difficulty"
                  ? filterDifficultyList.entries
                  : filterMuscleList.entries)
              .map<DropdownMenuItem<String>>(
                (MapEntry<String, String> unit) => DropdownMenuItem<String>(
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
