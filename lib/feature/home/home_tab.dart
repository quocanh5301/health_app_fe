import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_app_flutter/feature/home/bloc/home_cubit.dart';
import 'package:health_app_flutter/feature/home/bloc/home_state.dart';
import 'package:health_app_flutter/feature/home/widget/heart_rate_tile.dart';
import 'package:health_app_flutter/feature/home/widget/run_graph.dart';
import 'package:health_app_flutter/util/common_widget/auto_slider.dart';
import 'package:health_app_flutter/util/images.dart';
import 'package:health_app_flutter/util/injection.dart';
import 'package:health_app_flutter/util/styles.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => sl<HomeCubit>()
          ..getMyRunData()
          ..getMyHeartData(),
        child: BlocBuilder<HomeCubit, HomeState>(
          buildWhen: (previous, current) =>
              previous.getYourDataStatus != current.getYourDataStatus ||
              previous.lastWeekRunDatas != current.lastWeekRunDatas ||
              previous.myBPMDatas != current.myBPMDatas ||
              previous.thisWeekRunDatas != current.thisWeekRunDatas ||
              previous.myBPMDatas != current.myBPMDatas,
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: Image.asset(
                      AppImage.imgIcon,
                      width: AppStyles.width(200),
                      height: AppStyles.height(200),
                      // color: '#FF6B00'.toColor(),
                    ),
                  ),
                  const VerticalSpace(20),
                  AutoSlider(
                    width: AppStyles.screenW,
                    height: AppStyles.width(200),
                    images: const [
                      AppImage.imgIntro1,
                      AppImage.imgIntro2,
                      AppImage.imgIntro3,
                    ],
                    startAutoSlide: true,
                  ),
                  const VerticalSpace(20),
                  SizedBox(
                    width: AppStyles.screenW - 30,
                    height: AppStyles.screenW / 1.7,
                    child: const MyRunGraph(),
                  ),
                  const VerticalSpace(30),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(10),
                    itemCount: state.myBPMDatas.length,
                    itemBuilder: (context, index) {
                      return BPMTile(
                        data: state.myBPMDatas[index],
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const VerticalSpace(10),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
