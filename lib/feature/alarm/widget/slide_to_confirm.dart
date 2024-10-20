import 'package:flutter/material.dart';

class SlideToConfirm extends StatefulWidget {
  final Function
      onConfirm; // The callback function to trigger at the end of the slide

  const SlideToConfirm({super.key, required this.onConfirm});

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
        }
        // Reset the position after completion
        setState(() {
          _dragPosition = 0.0;
        });
      },
      child: Stack(
        children: [
          // The background track
          Container(
            width: _maxDrag +
                60, // Width includes extra space for the draggable button
            height: 60.0,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Center(
              child: Text(
                'Slide to confirm',
                style: TextStyle(fontSize: 18, color: Colors.black87),
              ),
            ),
          ),
          // The "trail" color that appears as you slide
          Container(
            width: _dragPosition + 30, // Slightly larger to cover button area
            height: 60.0,
            decoration: BoxDecoration(
              color: Colors.greenAccent
                  .withOpacity(0.5), // Color for the left trail
              borderRadius:
                  BorderRadius.horizontal(left: Radius.circular(30.0)),
            ),
          ),
          // The draggable button
          Positioned(
            left: _dragPosition,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Icon(Icons.arrow_forward, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
