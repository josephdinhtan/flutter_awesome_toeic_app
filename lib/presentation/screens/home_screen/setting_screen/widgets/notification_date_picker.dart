import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toeic_quiz2/core_ui/extensions/extensions.dart';

List<String> _frequency = ['daily', 'weekly', 'monthly'];
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
    return GestureDetector(
      onTap: () {
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
      child: Container(
        color: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Frequency', style: context.titleSmall),
              Row(
                children: [
                  Text(
                    widget.initFrequency,
                    style: context.labelMedium!.copyWith(color: Colors.grey),
                  ),
                  SizedBox(width: 8.w),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 10.w,
                    color: Colors.grey,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
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
