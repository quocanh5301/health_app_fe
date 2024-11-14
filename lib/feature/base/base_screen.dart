import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:health_app_flutter/feature/alarm/alarm_list_screen.dart';
import 'package:health_app_flutter/feature/base/bloc/base_cubit.dart';
import 'package:health_app_flutter/feature/base/bloc/base_state.dart';
import 'package:health_app_flutter/util/common_widget/auto_slider.dart';
import 'package:health_app_flutter/util/common_widget/overlay/my_overlay_controller.dart';
import 'package:health_app_flutter/util/images.dart';
import 'package:health_app_flutter/util/injection.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final List<IconData> iconList = [
    Icons.home,
    Icons.explore,
    Icons.alarm,
    Icons.person,
  ];

  BaseCubit baseCubit = sl<BaseCubit>()..setUpAlarm();

  @override
  void dispose() {
    baseCubit.disposeAlarm();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(systemNavigationBarColor: Colors.grey[800]));
    return BlocProvider<BaseCubit>(
      create: (context) => baseCubit,
      child: BlocBuilder<BaseCubit, BaseState>(
        builder: (context, state) {
          return Scaffold(
            // extendBody: true,
            body: _getSelectedPage(state.tabIndex),
            floatingActionButton: FloatingActionButton(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              backgroundColor: Colors.grey[800],
              onPressed: () =>
                  MyOverlayController.showMeasureOptionDialog(context),
              child: SvgPicture.asset(
                AppImage.icMeasure,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
                width: 40.0,
                height: 40.0,
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: AnimatedBottomNavigationBar(
              icons: iconList,
              activeIndex: state.tabIndex,
              gapLocation: GapLocation.center,
              onTap: (index) {
                context.read<BaseCubit>().changeTab(index: index);
              },
              backgroundColor: Colors.grey[800],
              activeColor: Colors.blue,
              inactiveColor: Colors.grey,
              leftCornerRadius: 20,
              rightCornerRadius: 20,
            ),
          );
        },
      ),
    );
  }

  Widget _getSelectedPage(int index) {
    switch (index) {
      case 0:
        return const AutoSlider(
          images: [
            AppImage.imgIntro1,
            AppImage.imgIntro2,
            AppImage.imgIntro3,
          ],
          startAutoSlide: true,
        );
      case 1:
        return const Placeholder();
      case 2:
        return const AlarmListScreen();
      case 3:
        return const Placeholder();
      default:
        return const Placeholder();
    }
  }
}
