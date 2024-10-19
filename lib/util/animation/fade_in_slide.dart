// import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';

// class FadeInBounce extends StatelessWidget {
//   final Widget child;
//   final Duration duration;

//   const FadeInBounce({
//     super.key,
//     required this.child,
//     this.duration = const Duration(seconds: 1),
//   });

//   @override
//   Widget build(BuildContext context) {
//     return child
//         .animate()
//         .slide(
//             begin:
//                 const Offset(1, 0), // Slide in from the right (Offset: x = 1)
//             end: const Offset(0, 0), // End at the center (Offset: x = 0)
//             duration: duration) // Animation duration
//         .fadeIn(
//           duration: duration,
//           curve: Curves.easeIn,
//         ); // Fade in animation
//     // .scale(
//     //   duration: duration,
//     //   curve: Curves.elasticOut,
//     //   begin: const Offset(0.5, 0.5),
//     //   end: const Offset(1.0, 1.0),
//     // ); // Bounce effect with scaling
//     // .then() // Continue with the next animation
//     // .shake(
//     //   hz: 3, // Shake with 3 hertz
//     //   curve: Curves.easeInOut,
//     //   duration: const Duration(milliseconds: 500),
//     // ); // Additional shake effect
//   }
// }
