import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class FadeInBigger extends StatelessWidget {
  final Widget child;
  final Duration duration;

  const FadeInBigger({
    super.key,
    required this.child,
    this.duration = const Duration(seconds: 1),
  });

  @override
  Widget build(BuildContext context) {
    return child
        .animate()
        .scale(
          begin: const Offset(0.5, 0.5),
          end: const Offset(1, 1),
          duration: 300.ms,
        ) // Animate scaling from small (0.5) to full size (1.0)
        .fadeIn(duration: 300.ms); // Animate fade in over 800 milliseconds
  }
}
