import 'package:flutter/material.dart';
import 'package:health_app_flutter/util/styles.dart';

class ProgressBar extends StatefulWidget {
  final double value;

  const ProgressBar({required this.value});

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: LinearProgressIndicator(
        value: widget.value,
        backgroundColor: Colors.black,
        valueColor: AlwaysStoppedAnimation("DBA510".toColor()),
      ),
    );
  }
}
