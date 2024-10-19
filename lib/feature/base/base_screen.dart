import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_app_flutter/feature/base/bloc/base_bloc.dart';
import 'package:health_app_flutter/feature/base/bloc/base_state.dart';
import 'package:health_app_flutter/feature/base/widget/auto_slider.dart';
import 'package:health_app_flutter/feature/base/widget/slide_to_confirm.dart';
import 'package:health_app_flutter/feature/base/widget/story/story_screen.dart';
import 'package:health_app_flutter/feature/base/widget/time_picker.dart';
import 'package:health_app_flutter/util/injection.dart';

class BaseScreen extends StatelessWidget {
  BaseScreen({super.key});

  final List<IconData> iconList = [
    Icons.home,
    Icons.explore,
    Icons.person,
    Icons.person,
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(systemNavigationBarColor: Colors.grey[800]));
    return BlocProvider<BaseCubit>(
      create: (context) => sl<BaseCubit>(),
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
                Icons.add,
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
        return const AutoSlider();
      case 1:
        return Center(
          child: SlideToConfirm(
            onConfirm: () {
              // Action to take place when the slide is completed
              debugPrint('Confirmed!');
            },
          ),
        );
      case 2:
        return StoryScreen();
      case 3:
        return TimerPicker(
          selectedHour: 0,
          selectedMinute: 3,
          selectedSecond: 0,
          onHourSelected: (hour) {},
          onMinuteSelected: (minute) {},
          onSecondSelected: (second) {},
        );
      default:
        return const Placeholder();
    }
  }
}
