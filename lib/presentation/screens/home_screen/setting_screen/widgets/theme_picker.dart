import 'package:flutter/material.dart';
import 'package:flutter_toeic_quiz2/core_ui/extensions/extensions.dart';

final List<String> _themeModeStr = ['Follow system', 'Light', 'Dark'];

enum ThemeModeEnum { followSystem, light, dark }

class ThemePicker extends StatefulWidget {
  ThemePicker({
    super.key,
    required this.themeMode,
    required this.themeModeChange,
  });

  ThemeMode themeMode;
  Function(ThemeMode) themeModeChange;

  @override
  State<ThemePicker> createState() => _ThemePickerState();
}

class _ThemePickerState extends State<ThemePicker> {
  themeModeChange(ThemeMode themeMode) {
    widget.themeModeChange(themeMode);
    setState(() {
      widget.themeMode = themeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return ThemePickerPanel(
                themeMode: widget.themeMode,
                themeModeChange: themeModeChange,
              );
            });
      },
      child: Container(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Theme', style: context.titleSmall),
              Row(
                children: [
                  Text(
                    _themeModeStr[widget.themeMode.index],
                    style: context.labelMedium!.copyWith(color: Colors.grey),
                  ),
                  const SizedBox(width: 8.0),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 16.0,
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

class ThemePickerPanel extends StatefulWidget {
  ThemePickerPanel({
    Key? key,
    required this.themeMode,
    required this.themeModeChange,
  }) : super(key: key);

  ThemeMode themeMode;
  Function(ThemeMode) themeModeChange;

  @override
  State<ThemePickerPanel> createState() => _ThemePickerPanelState();
}

class _ThemePickerPanelState extends State<ThemePickerPanel> {
  ThemeModeEnum? _themeModeEnum;

  void _handleRadioValueChanged(ThemeModeEnum? value) {
    setState(() {
      _themeModeEnum = value;
      widget.themeModeChange(ThemeMode.values[value!.index]);
    });
  }

  @override
  void initState() {
    super.initState();
    _themeModeEnum = ThemeModeEnum.values[widget.themeMode.index];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      //decoration: BoxDecoration(
      //color: Colors.red,
      // borderRadius: BorderRadius.only(
      //   topLeft: Radius.circular(8.0),
      //   topRight: Radius.circular(8.0),
      // ),
      //),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.system_security_update_good_outlined),
                Text('Follow system'),
                Radio<ThemeModeEnum>(
                  value: ThemeModeEnum.followSystem,
                  groupValue: _themeModeEnum,
                  onChanged: _handleRadioValueChanged,
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.light_mode),
                Text('Light'),
                Radio<ThemeModeEnum>(
                  value: ThemeModeEnum.light,
                  groupValue: _themeModeEnum,
                  onChanged: _handleRadioValueChanged,
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.dark_mode),
                Text('Dark'),
                Radio<ThemeModeEnum>(
                  value: ThemeModeEnum.dark,
                  groupValue: _themeModeEnum,
                  onChanged: _handleRadioValueChanged,
                )
              ],
            )
          ]),
    );
  }
}
