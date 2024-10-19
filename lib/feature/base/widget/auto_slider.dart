import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:health_app_flutter/util/images.dart';
import 'package:health_app_flutter/util/styles.dart';

class AutoSlider extends StatefulWidget {
  const AutoSlider({super.key});

  @override
  State<AutoSlider> createState() => _AutoSliderState();
}

class _AutoSliderState extends State<AutoSlider> {
  final PageController _pageController = PageController(initialPage: 0);
  final List<String> images = [
    AppImage.imgIntro1,
    AppImage.imgIntro2,
    AppImage.imgIntro3
  ];
  int _currentPage = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentPage < images.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppStyles.height(400),
      child: PageView.builder(
        controller: _pageController,
        itemCount: images.length,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              // Do something when image is tapped
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(images[index]),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
              .animate()
              .slide(
                  begin: const Offset(
                      1, 0), // Slide in from the right (Offset: x = 1)
                  end: const Offset(0, 0), // End at the center (Offset: x = 0)
                  duration: 500.ms) // Animation duration
              .fadeIn(
                duration: 500.ms,
                curve: Curves.easeIn,
              );
        },
      ),
    );
  }
}
