import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:health_app_flutter/feature/exercise_detail.dart/bloc/exercise_detail_cubit.dart';
import 'package:health_app_flutter/feature/exercise_detail.dart/bloc/exercise_detail_state.dart';
import 'package:health_app_flutter/generated/l10n.dart';
import 'package:health_app_flutter/util/common_widget/firebase_image.dart';
import 'package:health_app_flutter/util/date_time.dart';
import 'package:health_app_flutter/util/images.dart';
import 'package:health_app_flutter/util/injection.dart';
import 'package:health_app_flutter/util/styles.dart';

class ExerciseDetailScreen extends StatelessWidget {
  const ExerciseDetailScreen({super.key, required this.exerciseId});
  final int exerciseId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ExerciseDetailCubit>(
      create: (context) => sl<ExerciseDetailCubit>()
        ..getExerciseDetail(
          exerciseId: exerciseId,
        ),
      child: BlocBuilder<ExerciseDetailCubit, ExerciseDetailState>(
        buildWhen: (previous, current) =>
            previous.getExerciseDetailStatus != current.getExerciseDetailStatus || 
            previous.markFavoriteExerciseStatus != current.markFavoriteExerciseStatus,
        builder: (context, state) {
          return Scaffold(
            backgroundColor: "#1f2933".toColor(),
            appBar: AppBar(
              backgroundColor: "#1f2933".toColor(),
              iconTheme: const IconThemeData(
                color: Colors.white,
              ),
              title: Text(
                S.of(context).exerciseDetail,
                style: AppStyles.f20sb().copyWith(
                  color: Colors.white,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () => context
                      .read<ExerciseDetailCubit>()
                      .markAsFavorite(exerciseId: exerciseId,),
                  icon: Icon(
                    (state.exerciseDetail.isFavorite ?? false)
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            body: state.getExerciseDetailStatus ==
                        GetExerciseDetailStatus.finish &&
                    state.exerciseDetail.id != 0
                ? SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Image Section
                        FirebaseImage(
                          imagePath: state.exerciseDetail.image ?? '',
                          emptyImagePath: AppImage.imgEmpty1,
                          cardHeight: AppStyles.screenW / 2,
                          cardWidth: AppStyles.screenW,
                        ),
                        const VerticalSpace(16),
                        // Exercise Name
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            state.exerciseDetail.exerciseName ??
                                S.of(context).noInfoField,
                            style: AppStyles.f18sb().copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const VerticalSpace(20),
                        // Exercise Details
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _detailCard(
                                'Calories',
                                '${state.exerciseDetail.calor} kcal',
                                SizedBox(
                                  width: AppStyles.height(20),
                                  height: AppStyles.height(20),
                                  child: SvgPicture.asset(
                                    AppImage.icCalor,
                                    colorFilter: const ColorFilter.mode(
                                      Colors.white,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ),
                              _detailCard(
                                'Duration',
                                DateTimeHelper.formatDuration(
                                    state.exerciseDetail.duration ?? 0),
                                const Icon(
                                  Icons.timer,
                                  color: Colors.white,
                                ),
                              ),
                              _detailCard(
                                'Difficulty',
                                state.exerciseDetail.difficulty ??
                                    S.of(context).noInfoField,
                                SizedBox(
                                  width: AppStyles.height(20),
                                  height: AppStyles.height(20),
                                  child: SvgPicture.asset(
                                    AppImage.icDifficulty,
                                    colorFilter: const ColorFilter.mode(
                                      Colors.white,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const VerticalSpace(16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: AppStyles.height(20),
                                    height: AppStyles.height(20),
                                    child: SvgPicture.asset(
                                      AppImage.icMuscleGroup,
                                      colorFilter: const ColorFilter.mode(
                                        Colors.white,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                  ),
                                  const HorizontalSpace(8),
                                  Expanded(
                                    child: Text(
                                      'Muscle Groups',
                                      style: AppStyles.f17sb().copyWith(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "Muscle Groups: ${state.exerciseDetail.muscleGroups?.join(', ') ?? S.of(context).noInfoField}",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppStyles.f16m().copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Guide Section
                        const VerticalSpace(16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.comment,
                                    color: Colors.white,
                                  ),
                                  const HorizontalSpace(8),
                                  Text(
                                    'Guide',
                                    style: AppStyles.f17sb().copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                state.exerciseDetail.guide ??
                                    S.of(context).noInfoField,
                                style: AppStyles.f16m().copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : state.getExerciseDetailStatus !=
                        GetExerciseDetailStatus.getting
                    ? SizedBox(
                        height: AppStyles.screenH / 3.5,
                        child: Center(
                          child: Text(
                            S.of(context).noData,
                            style: AppStyles.f20sb().copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
          );
        },
      ),
    );
  }

  Widget _detailCard(String title, String value, Widget icon) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            icon,
            const HorizontalSpace(8),
            Text(
              title,
              style: AppStyles.f16m().copyWith(
                color: Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: AppStyles.f16sb().copyWith(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
