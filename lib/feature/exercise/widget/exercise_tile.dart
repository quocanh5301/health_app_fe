import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:health_app_flutter/data/model/exercise_model.dart';
import 'package:health_app_flutter/generated/l10n.dart';
import 'package:health_app_flutter/util/common_widget/firebase_image.dart';
import 'package:health_app_flutter/util/date_time.dart';
import 'package:health_app_flutter/util/images.dart';
import 'package:health_app_flutter/util/router.dart';
import 'package:health_app_flutter/util/styles.dart';

class ExerciseTile extends StatelessWidget {
  const ExerciseTile({
    super.key,
    required this.exerciseModel,
    required this.cardWidth,
    required this.cardHeight,
  });

  final ExerciseModel exerciseModel;
  final double cardWidth;
  final double cardHeight;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          ExerciseDetailRoute(exerciseId: exerciseModel.id ?? 0).push(context),
      child: Stack(
        children: [
          Stack(
            children: [
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: FirebaseImage(
                  imagePath: exerciseModel.image ?? '',
                  emptyImagePath: AppImage.imgEmpty1,
                  cardHeight: cardHeight,
                  cardWidth: cardWidth,
                ),
              ),
            ],
          ),
          Container(
            width: cardWidth,
            height: cardHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: '#802D264f'.toColor().withOpacity(0.3),
            ),
          ),
          Positioned(
            bottom: AppStyles.height(8),
            child: Container(
              width: cardWidth - AppStyles.width(14),
              height: (cardHeight - AppStyles.height(33)) / 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: '#802D264f'.toColor(),
              ),
              margin: EdgeInsets.symmetric(horizontal: AppStyles.width(7)),
              padding: EdgeInsets.symmetric(horizontal: AppStyles.width(15)),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              exerciseModel.name ?? S.of(context).noInfoField,
                              style: AppStyles.f12r().copyWith(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Difficulty: ${exerciseModel.difficulty ?? S.of(context).noInfoField}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppStyles.f12r()
                                  .copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IntrinsicWidth(
                              child: Row(
                                children: [
                                  Text(
                                    "Calor burn: ",
                                    style: AppStyles.f12r().copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                  const HorizontalSpace(8),
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
                                  const HorizontalSpace(8),
                                  Text(
                                    (exerciseModel.calor ?? 0).toString(),
                                    style: AppStyles.f12m().copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            IntrinsicWidth(
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.timer,
                                    color: Colors.white,
                                  ),
                                  const HorizontalSpace(8),
                                  Text(
                                    DateTimeHelper.formatDuration(
                                        exerciseModel.duration ?? 0),
                                    style: AppStyles.f12m().copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
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
                                "Muscle Groups: ${exerciseModel.muscleGroups?.join(', ') ?? S.of(context).noInfoField}",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppStyles.f12r()
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
