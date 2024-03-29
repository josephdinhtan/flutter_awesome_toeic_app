import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toeic_quiz2/core_ui/extensions/extensions.dart';

import 'settings_title.dart';

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
    return SettingsTile(
        leadingIconData: Icons.phone_iphone,
        titleText: 'Theme',
        value: Text(_themeModeStr[widget.themeMode.index],
            style: context.titleMedium!
                .copyWith(fontWeight: FontWeight.w600, color: Colors.grey)),
        onPressed: () {
          showCupertinoModalPopup(
              context: context,
              builder: (context) {
                return CupertinoActionSheet(
                  message: ThemePickerPanel(
                    themeMode: widget.themeMode,
                    themeModeChange: themeModeChange,
                  ),
                  cancelButton: CupertinoDialogAction(
                    isDestructiveAction: true,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'),
                  ),
                );
              });
        });
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
    return Material(
      color: Colors.transparent,
      child: SizedBox(
        height: 200.h,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTapUp: (details) {
                  setState(() {
                    _themeModeEnum = ThemeModeEnum.followSystem;
                    widget.themeModeChange(
                        ThemeMode.values[ThemeModeEnum.followSystem.index]);
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 25.w,
                          height: 70.w,
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            shape: BoxShape.rectangle,
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8.r),
                              bottomLeft: Radius.circular(8.r),
                            ),
                          ),
                        ),
                        Container(
                          width: 25.w,
                          height: 70.w,
                          decoration: BoxDecoration(
                            color: Colors.black54,
                            shape: BoxShape.rectangle,
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8.r),
                              bottomRight: Radius.circular(8.r),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    const Text('Follow system'),
                    Radio<ThemeModeEnum>(
                      value: ThemeModeEnum.followSystem,
                      groupValue: _themeModeEnum,
                      onChanged: _handleRadioValueChanged,
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTapUp: (details) {
                  setState(() {
                    _themeModeEnum = ThemeModeEnum.light;
                    widget.themeModeChange(
                        ThemeMode.values[ThemeModeEnum.light.index]);
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 50.w,
                      height: 70.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(8.r)),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    const Text('Light'),
                    Radio<ThemeModeEnum>(
                      value: ThemeModeEnum.light,
                      groupValue: _themeModeEnum,
                      onChanged: _handleRadioValueChanged,
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTapUp: (details) {
                  setState(() {
                    _themeModeEnum = ThemeModeEnum.dark;
                    widget.themeModeChange(
                        ThemeMode.values[ThemeModeEnum.dark.index]);
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 50.w,
                      height: 70.w,
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        shape: BoxShape.rectangle,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(8.r)),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    const Text('Dark'),
                    Radio<ThemeModeEnum>(
                      value: ThemeModeEnum.dark,
                      groupValue: _themeModeEnum,
                      onChanged: _handleRadioValueChanged,
                    )
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
