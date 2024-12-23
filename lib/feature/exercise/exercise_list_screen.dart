import 'package:flutter/material.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_app_flutter/feature/exercise/bloc/exercise_list_cubit.dart';
import 'package:health_app_flutter/feature/exercise/bloc/exercise_list_state.dart';
import 'package:health_app_flutter/feature/exercise/widget/exercise_tile.dart';
import 'package:health_app_flutter/feature/exercise/widget/filter_type_dropdown.dart';
import 'package:health_app_flutter/feature/exercise/widget/filter_value_dropdown.dart';
import 'package:health_app_flutter/generated/l10n.dart';
import 'package:health_app_flutter/util/injection.dart';
import 'package:health_app_flutter/util/styles.dart';

class ExerciseListScreen extends StatelessWidget {
  const ExerciseListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ExerciseListCubit>(
      create: (context) => sl<ExerciseListCubit>()..getFilteredExercises(),
      child: BlocBuilder<ExerciseListCubit, ExerciseListState>(
        buildWhen: (previous, current) =>
            previous.getExerciseStatus != current.getExerciseStatus ||
            previous.filterType != current.filterType,
        builder: (context, state) {
          // final double imageHeight =
          //     (AppStyles.screenW - AppStyles.width(60)) / 2 * 203.0 / 185.0 / 2;
          debugPrint("state.filterType ${state.filterType}");
          debugPrint("state.getExerciseStatus ${state.getExerciseStatus}");

          return Container(
            // padding: const EdgeInsets.all(20),
            height: AppStyles.screenH,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: "#1f2933".toColor(),
            ),
            child: EasyRefresh(
              header: MaterialHeader(
                backgroundColor: '#FF6B00'.toColor(),
                color: Colors.white,
              ),
              triggerAxis: Axis.vertical,
              // canLoadAfterNoMore: false,
              footer: MaterialFooter(
                backgroundColor: '#FF6B00'.toColor(),
                color: Colors.white,
              ),
              onLoad: () async {
                if (state.getExerciseStatus != GetExerciseStatus.noMore) {
                  await context.read<ExerciseListCubit>().getMoreExercises();
                }
              },
              onRefresh: () =>
                  context.read<ExerciseListCubit>().refreshExercises(),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // MyCalendar(
                    //   firstDate: firstDate,
                    //   focusedDate: focusedDate,
                    // ),
                    AppBar(
                      backgroundColor: Colors.grey.withOpacity(0.3),
                      title: Text(
                        'Exercise List',
                        style: AppStyles.f20sb().copyWith(
                          color: "e0e0e0".toColor(),
                        ),
                      ),
                    ),
                    const VerticalSpace(20),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: FilterTypeDropDown(),
                    ),
                    state.filterType != "all"
                        ? const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            child: FilterValueDropDown(),
                          )
                        : const SizedBox.shrink(),
                    const VerticalSpace(15),
                    state.exercises.isNotEmpty
                        ?
                        // GridView.builder(
                        //     shrinkWrap: true,
                        //     gridDelegate:
                        //         SliverGridDelegateWithFixedCrossAxisCount(
                        //       crossAxisCount: 2,
                        //       childAspectRatio: 185.0 / 203.0,
                        //       crossAxisSpacing: AppStyles.width(20),
                        //       mainAxisSpacing: AppStyles.height(10),
                        //     ),
                        //     padding: EdgeInsets.symmetric(
                        //       horizontal: AppStyles.width(20),
                        //       vertical: AppStyles.height(10),
                        //     ),
                        //     itemCount: state.exercises.length,
                        //     itemBuilder: (context, index) {
                        //       return ExerciseTile(
                        //         exerciseModel: state.exercises[index],
                        //         cardWidth: AppStyles.screenW / 3,
                        //         cardHeight: imageHeight,
                        //       );
                        //     },
                        //   )
                        ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: state.exercises.length,
                            separatorBuilder: (context, index) =>
                                const VerticalSpace(20),
                            padding: const EdgeInsets.all(15),
                            itemBuilder: (context, index) {
                              return ExerciseTile(
                                exerciseModel: state.exercises[index],
                                cardWidth: AppStyles.screenW - 30,
                                cardHeight: AppStyles.screenW / 2,
                              );
                            },
                          )
                        : state.getExerciseStatus != GetExerciseStatus.getting
                            ? SizedBox(
                                height: AppStyles.screenH / 3.5,
                                child: Center(
                                  child: Text(
                                    S.of(context).noData,
                                    style: AppStyles.f20sb().copyWith(
                                      color: "e0e0e0".toColor(),
                                    ),
                                  ),
                                ),
                              )
                            : const Center(
                                child: CircularProgressIndicator(),
                              ),
                    const VerticalSpace(60),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
