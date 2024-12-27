import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:health_app_flutter/data/model/basic_heart_rate_data.dart';
import 'package:health_app_flutter/util/images.dart';
import 'package:health_app_flutter/util/styles.dart';

class BPMTile extends StatelessWidget {
  const BPMTile({super.key, required this.data});

  final BasicHeartRateData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      // width: AppStyles.screenW,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const HorizontalSpace(15),
          SvgPicture.asset(
            AppImage.icHeart,
            colorFilter: const ColorFilter.mode(
              Colors.black,
              BlendMode.srcIn,
            ),
            width: 50,
            height: 50,
          ),
          const HorizontalSpace(13),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: "Beats per minute (BPM) ",
                    style: AppStyles.f16sb().copyWith(color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: data.bpm.toString(),
                        style: AppStyles.f16sb().copyWith(
                          decoration: TextDecoration.underline,
                          color: '#FF6B00'.toColor(),
                        ),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: "Stress Level ",
                    style: AppStyles.f16sb().copyWith(color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: data.stressLevel.toString(),
                        style: AppStyles.f16sb().copyWith(
                          decoration: TextDecoration.underline,
                          color: '#FF6B00'.toColor(),
                        ),
                      ),
                    ],
                  ),
                ),
                Text((data.measuredAt ?? "Today ").split(' ')[0]),
                Text((data.measuredAt ?? " ").split(' ')[1]),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
