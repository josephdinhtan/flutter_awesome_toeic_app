import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_toeic_quiz2/core_ui/extensions/extensions.dart';

const initTime = Duration(minutes: 120);

class TimerTestWidget extends StatefulWidget {
  TimerTestWidget({super.key, required this.timeUp});
  final Function() timeUp;
  late int timeInSecond;
  @override
  State<TimerTestWidget> createState() => _TimerTestWidgetState();
}

class _TimerTestWidgetState extends State<TimerTestWidget> {
  @override
  void initState() {
    super.initState();
    widget.timeInSecond = initTime.inSeconds;
    Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        setState(() {
          widget.timeInSecond--;
        });
        if (widget.timeInSecond == 0) {
          widget.timeUp();
          timer.cancel();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    String timeDisplay =
        Duration(seconds: widget.timeInSecond).toHumanizedMinutesString();
    return Text(timeDisplay, style: context.titleMedium);
  }
}
