import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_app_flutter/feature/base/bloc/base_cubit.dart';
import 'package:health_app_flutter/feature/base/bloc/base_state.dart';
import 'package:health_app_flutter/util/common_widget/auto_slider.dart';
import 'package:health_app_flutter/feature/alarm/widget/slide_to_confirm.dart';
import 'package:health_app_flutter/util/common_widget/story/story_screen.dart';
import 'package:health_app_flutter/util/common_widget/overlay/overlay_widget/time_picker.dart';
import 'package:health_app_flutter/util/images.dart';
import 'package:health_app_flutter/util/injection.dart';
import 'package:health_app_flutter/util/router.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final List<IconData> iconList = [
    Icons.home,
    Icons.explore,
    Icons.menu,
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
            body: _getSelectedPage(state.tabIndex),
            floatingActionButton: FloatingActionButton(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              backgroundColor: Colors.grey[800],
              onPressed: () {
                // Implement any FAB action if needed
              },
              child: const Icon(
                Icons.run_circle,
                color: Colors.white,
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
        );
      case 1:
        return Center(
          child: SlideToConfirm(
            title: 'Slide to view alarms',
            onConfirm: () {
              // Action to take place when the slide is completed
              const AlarmListgRoute()
                  .push(rootNavigatorKey.currentState!.context);
              debugPrint('Confirmed!');
            },
          ),
        );
      case 2:
        return StoryScreen();
      case 3:
        return const TimerPicker(
          selectedHour: 0,
          selectedMinute: 0,
          selectedSecond: 0,
        );
      default:
        return const Placeholder();
    }
  }
}
