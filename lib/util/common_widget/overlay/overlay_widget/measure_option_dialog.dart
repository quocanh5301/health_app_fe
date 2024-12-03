import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:health_app_flutter/util/images.dart';
import 'package:health_app_flutter/util/router.dart';
import 'package:health_app_flutter/util/styles.dart';

class MeasureDialog extends StatelessWidget {
  const MeasureDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: IntrinsicHeight(
        child: Container(
          decoration: BoxDecoration(
            color: '#2b2b2b'.toColor(),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 5, 15, 20),
            child: Stack(
              children: [
                Column(
                  children: [
                    const VerticalSpace(55),
                    InkWell(
                      onTap: () => const RunTrackingRoute().push(context),
                      child: Container(
                        decoration: BoxDecoration(
                          color: '#2b2b2b'.toColor(),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: '#DBA510'.toColor(),
                          ),
                        ),
                        padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Run Tracking",
                              style: AppStyles.f17sb()
                                  .copyWith(color: Colors.white),
                            ),
                            const Icon(
                              Icons.run_circle,
                              color: Colors.white,
                              size: 40,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const VerticalSpace(10),
                    InkWell(
                      onTap: () => const HeartBPMTrackingRoute().push(context),
                      child: Container(
                        decoration: BoxDecoration(
                          color: '#2b2b2b'.toColor(),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: '#DBA510'.toColor(),
                          ),
                        ),
                        padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "BPM Tracking",
                              style: AppStyles.f17sb()
                                  .copyWith(color: Colors.white),
                            ),
                            SvgPicture.asset(
                              AppImage.icHeart,
                              colorFilter: const ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              ),
                              width: 40,
                              height: 40,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 0,
                  right: 3,
                  child: IconButton(
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                    onPressed: () => Navigator.of(context).pop(null),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
