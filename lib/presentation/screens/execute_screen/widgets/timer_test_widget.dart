import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_toeic_quiz2/core_ui/extensions/extensions.dart';

const initTime = Duration(
  minutes: 120,
  seconds: 0,
);

int timeInSecond = 0;

class TimerTestWidget extends StatefulWidget {
  TimerTestWidget({super.key, required this.timeUp});
  final Function() timeUp;
  @override
  State<TimerTestWidget> createState() => _TimerTestWidgetState();
}

class _TimerTestWidgetState extends State<TimerTestWidget> {
  @override
  void initState() {
    super.initState();
    timeInSecond = initTime.inSeconds;
    Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        setState(() {
          timeInSecond--;
        });
        if (timeInSecond == 0) {
          widget.timeUp();
          timer.cancel();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    String timeDisplay =
        Duration(seconds: timeInSecond).toHumanizedMinutesString();
    return Text(timeDisplay, style: context.titleMedium);
  }
}
