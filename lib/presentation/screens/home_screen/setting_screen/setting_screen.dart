import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_toeic_quiz2/core_ui/extensions/extensions.dart';
import 'package:flutter_toeic_quiz2/presentation/screens/home_screen/setting_screen/widgets/settings_list.dart';
import 'package:flutter_toeic_quiz2/presentation/screens/home_screen/setting_screen/widgets/settings_title.dart';
import 'package:flutter_toeic_quiz2/view_model/settings_screen_cubit/settings_screen_cubit.dart';

import '../../../../core_ui/theme/theme.dart';
import '../../../../core_utils/core_utils.dart';
import 'widgets/color_picker.dart';
import 'widgets/language_picker.dart';
import 'widgets/notification_date_picker.dart';
import 'widgets/notification_time_picker.dart';
import 'widgets/settings_section.dart';
import 'widgets/theme_picker.dart';

class SettingScreen extends StatefulWidget {
  SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool darkModeEnable = false;

  List<bool> isSelected = [false, false, false];

  @override
  Widget build(BuildContext context) {
    final themeMode = getApplicationThemeMode();
    isSelected[themeMode.index] = true;
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'.toUpperCase()),
      ),
      //body: OldSettingsItems(),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: 'Appearance',
            titles: [
              ThemePicker(
                themeMode: ThemeProvider.of(context).settings.value.themeMode,
                themeModeChange: (themeMode) {
                  final themeProvider = ThemeProvider.of(context);
                  final settings = themeProvider.settings.value;
                  final newSettings = settings.copyWith(themeMode: themeMode);
                  ThemeSettingChange(settings: newSettings).dispatch(context);

                  BlocProvider.of<SettingsScreenCubit>(context)
                      .saveThemeMode(themeMode);
                },
              ),
            ],
          ),
          SettingsSection(
            title: 'Main Color',
            titles: [
              ColorPicker(
                themeColor: ThemeProvider.of(context).settings.value.themeColor,
                themeColorChange: (themeColor) {
                  final themeProvider = ThemeProvider.of(context);
                  final settings = themeProvider.settings.value;
                  final newSettings = settings.copyWith(themeColor: themeColor);
                  ThemeSettingChange(settings: newSettings).dispatch(context);

                  BlocProvider.of<SettingsScreenCubit>(context)
                      .saveThemeColor(themeColor);
                },
              ),
            ],
          ),
          SettingsSection(titles: [
            LanguagePicker(
              language: 'En',
              languageChange: (p0) {},
            ),
          ]),
          SettingsSection(
            title: 'Notification',
            titles: [
              NotificationDatePicker(
                  initFrequency: 'Daily', frequencyChange: (frequency) {}),
              NotificationTimePicker(
                  initTime: '8:20', timeChange: (duration) {}),
            ],
          ),
          SettingsSection(
            title: 'Community',
            titles: [
              SettingsTile(
                leadingIconData: Icons.star_rate_outlined,
                titleText: 'Rate us 5 star',
                onPressed: () {},
              ),
              SettingsTile(
                leadingIconData: Icons.speaker_notes_rounded,
                titleText: 'Feedback',
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
