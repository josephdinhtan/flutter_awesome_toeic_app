import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core_ui/extensions/extensions.dart';
import 'settings_title.dart';

const double _kItemExtent = 32.0;

class NotificationTimePicker extends StatefulWidget {
  NotificationTimePicker({
    super.key,
    required this.initTime,
    required this.timeChange,
  });

  String initTime;
  final Function(String) timeChange;

  @override
  State<NotificationTimePicker> createState() => _NotificationTimePickerState();
}

class _NotificationTimePickerState extends State<NotificationTimePicker> {
  late Duration _selectedDuration;
  _colorChange(Duration duration) {
    setState(() {
      _selectedDuration = duration;
    });
  }

  @override
  void initState() {
    super.initState();
    _selectedDuration = widget.initTime.toDuration();
  }

  @override
  Widget build(BuildContext context) {
    return SettingsTile(
      leadingIconData: Icons.access_time,
      titleText: 'Time',
      value: Text(widget.initTime,
          style: context.titleMedium!
              .copyWith(fontWeight: FontWeight.w600, color: Colors.grey)),
      onPressed: () {
        showCupertinoModalPopup(
            context: context,
            builder: (context) {
              return CupertinoActionSheet(
                message: TimePickerPanel(
                  initialDuration: widget.initTime.toDuration(),
                  onSelectChange: (value) {
                    _colorChange(value);
                  },
                ),
                actions: [
                  CupertinoDialogAction(
                    onPressed: () {
                      widget.timeChange(_selectedDuration.toHumanizedString());
                      setState(() {
                        widget.initTime = _selectedDuration.toHumanizedString();
                      });
                      Navigator.pop(context);
                    },
                    child: const Text('OK'),
                  ),
                ],
                cancelButton: CupertinoDialogAction(
                  isDestructiveAction: true,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
              );
            });
      },
    );
  }
}

class TimePickerPanel extends StatefulWidget {
  TimePickerPanel({
    Key? key,
    required this.onSelectChange,
    required this.initialDuration,
    this.circleItem = true,
  }) : super(key: key);

  final Function onSelectChange;
  final bool circleItem;
  final Duration initialDuration;

  @override
  State<TimePickerPanel> createState() => _TimePickerPanelState();
}

class _TimePickerPanelState extends State<TimePickerPanel> {
  late Duration duration;

  @override
  void initState() {
    super.initState();
    duration = widget.initialDuration;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: Center(
        child: CupertinoTimerPicker(
          mode: CupertinoTimerPickerMode.hm,
          initialTimerDuration: duration,
          // This is called when the user changes the timer duration.
          onTimerDurationChanged: (Duration newDuration) {
            setState(() => duration = newDuration);
            widget.onSelectChange(newDuration);
          },
        ),
      ),
    );
  }
}
