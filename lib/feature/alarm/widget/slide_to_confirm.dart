import 'package:flutter/material.dart';
import 'package:health_app_flutter/util/styles.dart';

class SlideToConfirm extends StatefulWidget {
  final Function
      onConfirm; // The callback function to trigger at the end of the slide
  final String title;

  const SlideToConfirm({
    super.key,
    required this.onConfirm,
    required this.title,
  });

  @override
  State<SlideToConfirm> createState() => _SlideToConfirmState();
}

class _SlideToConfirmState extends State<SlideToConfirm> {
  double _dragPosition = 0.0;
  final double _maxDrag = 300.0; // Maximum drag distance

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        setState(() {
          _dragPosition += details.delta.dx;
          if (_dragPosition < 0) _dragPosition = 0;
          if (_dragPosition > _maxDrag) _dragPosition = _maxDrag;
        });
      },
      onHorizontalDragEnd: (details) {
        if (_dragPosition >= _maxDrag) {
          widget.onConfirm(); // Trigger the callback function
          Future.delayed(const Duration(seconds: 1), () {
            if (mounted) {
              setState(() {
                _dragPosition = 0.0;
              });
            }
          });
        } else {
          setState(
            () {
              _dragPosition = 0.0;
            },
          );
        }
      },
      child: Stack(
        children: [
          // The background track
          Container(
            width: _maxDrag +
                60, // Width includes extra space for the draggable button
            height: 60.0,
            decoration: BoxDecoration(
              color: "FBE888".toColor(),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Center(
              child: Text(
                widget.title,
                style: AppStyles.f18b().copyWith(
                    // color: Colors.white,
                    ),
              ),
            ),
          ),
          // The "trail" color that appears as you slide
          Container(
            width: _dragPosition + 30, // Slightly larger to cover button area
            height: 60.0,
            decoration: BoxDecoration(
              color: "FBE888"
                  .toColor()
                  .withOpacity(0.5), // Color for the left trail
              borderRadius:
                  const BorderRadius.horizontal(left: Radius.circular(30.0)),
            ),
          ),
          // The draggable button
          Positioned(
            left: _dragPosition,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: "263238".toColor(),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Icon(Icons.alarm, color: "64b5f6".toColor()),
            ),
          ),
        ],
      ),
    );
  }
}
