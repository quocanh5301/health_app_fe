import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SlideAndFade extends StatelessWidget {
  final Widget child;
  final Duration duration;

  const SlideAndFade({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
  });

  @override
  Widget build(BuildContext context) {
    // Use flutter_animate for animation
    return child
        .animate()
        .slide(
            begin: const Offset(1, 0),
            duration: duration) // Slide from right to left
        .fadeIn(duration: duration); // Fade in effect
  }
}
