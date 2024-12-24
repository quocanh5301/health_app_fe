import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_app_flutter/feature/bookmark_exercise/bloc/bookmark_exercise_cubit.dart';
import 'package:health_app_flutter/feature/bookmark_exercise/bloc/bookmark_exercise_state.dart';
import 'package:health_app_flutter/feature/exercise/widget/exercise_tile.dart';
import 'package:health_app_flutter/generated/l10n.dart';
import 'package:health_app_flutter/util/injection.dart';
import 'package:health_app_flutter/util/styles.dart';

class BookmarkExerciseList extends StatelessWidget {
  const BookmarkExerciseList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<BookmarkExerciseCubit>()..refreshBookmarkExercise(),
      child: BlocBuilder<BookmarkExerciseCubit, BookmarkExerciseState>(
        buildWhen: (previous, current) =>
            previous.getBookmarkExerciseStatus !=
            current.getBookmarkExerciseStatus,
        builder: (context, state) {
          debugPrint("BookmarkExerciseList state: ${state.getBookmarkExerciseStatus}");
          return Scaffold(
            backgroundColor: "#1f2933".toColor(),
            appBar: AppBar(
              backgroundColor: "#1f2933".toColor(),
              iconTheme: const IconThemeData(
                color: Colors.white,
              ),
              title: Text(
                "Your bookmarked exercises",
                style: AppStyles.f20sb().copyWith(
                  color: Colors.white,
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  state.bookmarkExercises.isNotEmpty
                      ? ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: state.bookmarkExercises.length,
                          separatorBuilder: (context, index) =>
                              const VerticalSpace(20),
                          padding: const EdgeInsets.all(15),
                          itemBuilder: (context, index) {
                            return ExerciseTile(
                              exerciseModel: state.bookmarkExercises[index],
                              cardWidth: AppStyles.screenW - 30,
                              cardHeight: AppStyles.screenW / 2,
                            );
                          },
                        )
                      : state.getBookmarkExerciseStatus !=
                              GetBookmarkExerciseStatus.getting
                          ? SizedBox(
                              height: AppStyles.screenH / 1.3,
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
          );
        },
      ),
    );
  }
}
