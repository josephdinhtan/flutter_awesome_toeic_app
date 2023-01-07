import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toeic_quiz2/core_ui/extensions/extensions.dart';

import 'settings_title.dart';

List<String> _frequency = ['Daily'];
const double _kItemExtent = 32.0;

class NotificationDatePicker extends StatefulWidget {
  NotificationDatePicker({
    super.key,
    required this.initFrequency,
    required this.frequencyChange,
  });

  String initFrequency;
  final Function(String) frequencyChange;

  @override
  State<NotificationDatePicker> createState() => _NotificationDatePickerState();
}

class _NotificationDatePickerState extends State<NotificationDatePicker> {
  String _selectedLanguage = "";
  _colorChange(String language) {
    setState(() {
      _selectedLanguage = language;
    });
  }

  @override
  void initState() {
    super.initState();
    _selectedLanguage = widget.initFrequency;
  }

  @override
  Widget build(BuildContext context) {
    return SettingsTile(
      leadingIconData: Icons.date_range,
      titleText: 'Date',
      value: Text(widget.initFrequency,
          style: context.titleMedium!
              .copyWith(fontWeight: FontWeight.w600, color: Colors.grey)),
      onPressed: () {
        showCupertinoModalPopup(
            context: context,
            builder: (context) {
              return CupertinoActionSheet(
                message: FrequencyPickerPanel(
                  initialFrequency: widget.initFrequency,
                  onSelectChange: (value) {
                    _colorChange(value);
                  },
                ),
                actions: [
                  CupertinoDialogAction(
                    onPressed: () {
                      widget.frequencyChange(_selectedLanguage);
                      setState(() {
                        widget.initFrequency = _selectedLanguage;
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

class FrequencyPickerPanel extends StatefulWidget {
  FrequencyPickerPanel({
    Key? key,
    required this.onSelectChange,
    required this.initialFrequency,
    this.circleItem = true,
  }) : super(key: key);

  final Function onSelectChange;
  final bool circleItem;
  final String initialFrequency;

  @override
  State<FrequencyPickerPanel> createState() => _FrequencyPickerPanelState();
}

class _FrequencyPickerPanelState extends State<FrequencyPickerPanel> {
  late String _pickedLanguage;
  int _selectedFrequency = 0;

  @override
  void initState() {
    super.initState();
    _pickedLanguage = widget.initialFrequency;
    for (int i = 0; i < _frequency.length; i++) {
      if (widget.initialFrequency == _frequency[i]) {
        _selectedFrequency = i;
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      child: Center(
        child: CupertinoPicker(
          magnification: 1.22,
          squeeze: 1.2,
          useMagnifier: true,
          itemExtent: _kItemExtent,
          // This is called when selected item is changed.
          onSelectedItemChanged: (int selectedItem) {
            setState(() {
              _selectedFrequency = selectedItem;
              widget.onSelectChange(_frequency[selectedItem]);
            });
          },
          children: List<Widget>.generate(_frequency.length, (int index) {
            return Center(
              child: Text(
                _frequency[index],
              ),
            );
          }),
        ),
      ),
    );
  }
}
