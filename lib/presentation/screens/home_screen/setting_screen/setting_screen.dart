import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_toeic_quiz2/core_ui/extensions/extensions.dart';
import 'package:flutter_toeic_quiz2/view_model/settings_screen_cubit/settings_screen_cubit.dart';

import '../../../../core_ui/theme/theme.dart';
import '../../../../core_utils/core_utils.dart';
import 'widgets/color_picker.dart';
import 'widgets/language_picker.dart';
import 'widgets/notification_date_picker.dart';
import 'widgets/notification_time_picker.dart';
import 'widgets/settings_container.dart';
import 'widgets/theme_picker.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({Key? key}) : super(key: key);
  bool darkModeEnable = false;
  List<bool> isSelected = [false, false, false];

  @override
  Widget build(BuildContext context) {
    final themeMode = getApplicationThemeMode();
    isSelected[themeMode.index] = true;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 12.h),
              Text('Appearance', style: context.labelMedium),
              SizedBox(height: 4.h),
              SettingContainer(
                children: [
                  ThemePicker(
                    themeMode:
                        ThemeProvider.of(context).settings.value.themeMode,
                    themeModeChange: (themeMode) {
                      final themeProvider = ThemeProvider.of(context);
                      final settings = themeProvider.settings.value;
                      final newSettings =
                          settings.copyWith(themeMode: themeMode);
                      ThemeSettingChange(settings: newSettings)
                          .dispatch(context);

                      BlocProvider.of<SettingsScreenCubit>(context)
                          .saveThemeMode(themeMode);
                    },
                  ),
                  ColorPicker(
                    themeColor:
                        ThemeProvider.of(context).settings.value.themeColor,
                    themeColorChange: (themeColor) {
                      final themeProvider = ThemeProvider.of(context);
                      final settings = themeProvider.settings.value;
                      final newSettings =
                          settings.copyWith(themeColor: themeColor);
                      ThemeSettingChange(settings: newSettings)
                          .dispatch(context);

                      BlocProvider.of<SettingsScreenCubit>(context)
                          .saveThemeColor(themeColor);
                    },
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              SettingContainer(
                children: [
                  LanguagePicker(
                    language: 'en',
                    languageChange: (language) {},
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Text('Notification', style: context.labelMedium),
              SizedBox(height: 4.h),
              SettingContainer(
                children: [
                  NotificationDatePicker(
                      initFrequency: 'daily', frequencyChange: (frequency) {}),
                  NotificationTimePicker(
                      initTime: '8:20', timeChange: (duration) {}),
                ],
              ),
              SizedBox(height: 12.h),
              Text('Community', style: context.labelMedium),
              SizedBox(height: 4.h),
              SettingContainer(
                children: [
                  TextButton.icon(
                    onPressed: () {},
                    icon: Padding(
                      padding: EdgeInsets.only(left: 8.w),
                      child: Icon(Icons.star_rate_outlined),
                    ),
                    label: SizedBox(
                      width: double.infinity,
                      child: Text(
                        'Rate us 5 star', /* style: kTextStyleSettingsH1*/
                      ),
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: Padding(
                      padding: EdgeInsets.only(left: 8.w),
                      child: Icon(Icons.speaker_notes_rounded),
                    ),
                    label: SizedBox(
                      width: double.infinity,
                      child: Text(
                        'Feedback', /*style: kTextStyleSettingsH1*/
                      ),
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: Padding(
                      padding: EdgeInsets.only(left: 8.w),
                      child: Icon(Icons.share_rounded),
                    ),
                    label: SizedBox(
                      width: double.infinity,
                      child: Text(
                        'Share', /* style: kTextStyleSettingsH1*/
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.h),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // Navigator.push(
                          //     context,
                          //     CupertinoPageRoute(
                          //       builder: (context) => FirebaseScreen(),
                          //     ));
                        },
                        icon: const Icon(Icons.data_saver_off),
                        label: const Text('Check Server Storage (Admin only)'),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4.h),
            ],
          ),
        ),
      ),
    );
  }
}
