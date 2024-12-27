import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:health_app_flutter/util/styles.dart';

class AutoSlider extends StatefulWidget {
  final List<String> images;
  final bool startAutoSlide;
  final double? height;
  final double? width;
  const AutoSlider({
    super.key,
    required this.images,
    required this.startAutoSlide,
    this.height,
    this.width,
  });

  @override
  State<AutoSlider> createState() => _AutoSliderState();
}

class _AutoSliderState extends State<AutoSlider> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  Timer? _timer;
  bool _isAutoSlidingPaused = true; // Start with sliding paused initially

  @override
  void initState() {
    super.initState();
    // Do not start auto sliding initially; wait for the first tap
    if (widget.startAutoSlide) {
      _resumeAutoSlide();
    }
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (!_isAutoSlidingPaused) {
        if (_currentPage < widget.images.length - 1) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn,
        );
      }
    });
  }

  void _stopAutoSlide() {
    _isAutoSlidingPaused = true;
    _timer?.cancel();
  }

  void _resumeAutoSlide() {
    _isAutoSlidingPaused = false;
    _timer?.cancel();
    _startAutoSlide();
  }

  void _onUserTap() {
    if (_isAutoSlidingPaused) {
      _resumeAutoSlide();
    } else {
      _stopAutoSlide();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height ?? AppStyles.width(400),
      width: widget.width ?? AppStyles.width(400),
      child: GestureDetector(
        onTap: _onUserTap, // Start auto slide on first tap
        onLongPress: _stopAutoSlide, // Stop sliding on long press
        onLongPressUp:
            _resumeAutoSlide, // Resume sliding when long press is released
        child: PageView.builder(
          controller: _pageController,
          itemCount: widget.images.length,
          onPageChanged: (index) {
            setState(() {
              _currentPage = index;
            });
          },
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(widget.images[index]),
                  fit: BoxFit.cover,
                ),
              ),
            )
                .animate()
                .slide(
                  begin: const Offset(1, 0), // Slide in from the right
                  end: const Offset(0, 0), // End at the center
                  duration: 500.ms, // Animation duration
                )
                .fadeIn(
                  duration: 500.ms,
                  curve: Curves.easeIn,
                );
          },
        ),
      ),
    );
  }
}
