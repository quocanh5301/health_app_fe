import 'package:flutter/material.dart';

class RoundProgressBar extends StatefulWidget {
  final int duration; // in seconds
  final Function() onFinish;
  final Function() onReset;
  final IconData playIcon;
  final IconData pauseIcon;

  const RoundProgressBar({
    super.key,
    required this.duration,
    required this.onFinish,
    required this.onReset,
    this.playIcon = Icons.play_arrow,
    this.pauseIcon = Icons.pause,
  });

  @override
  State<RoundProgressBar> createState() => _RoundProgressBarState();
}

class _RoundProgressBarState extends State<RoundProgressBar>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Duration initialDuration;
  bool isPaused = false;
  bool isFinished = false;

  @override
  void initState() {
    super.initState();
    // Convert time string to duration
    initialDuration = _intToDuration(widget.duration);
    _controller = AnimationController(
      vsync: this,
      duration: initialDuration,
    )..addListener(() {
        if (_controller.isDismissed && !isPaused) {
          widget.onFinish();
        }
      });
  }

  Duration _intToDuration(int duration) {
    return Duration(seconds: duration);
  }

  void _onTap() {
    setState(() {
      if (isFinished) return;
      if (isPaused) {
        _controller.forward();
      } else {
        _controller.stop();
      }
      isPaused = !isPaused;
    });
  }

  void _onLongPress() {
    setState(() {
      _controller.reset();
      _controller.duration = initialDuration;
      _controller.forward();
      isPaused = false;
      isFinished = false;
      widget.onReset();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      onLongPress: _onLongPress,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(
            value: 1.0 - (_controller.value),
            strokeWidth: 8,
          ),
          Icon(
            isPaused ? widget.playIcon : widget.pauseIcon,
            size: 48,
          ),
        ],
      ),
    );
  }
}
