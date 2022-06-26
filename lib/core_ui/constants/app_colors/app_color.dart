import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_toeic_quiz2/core_ui/constants/app_colors/app_dark_color_impl.dart';
import 'package:flutter_toeic_quiz2/core_ui/constants/app_colors/app_light_color_impl.dart';

abstract class AppColor {
  // factory AppColor(ThemeMode themeMode) {
  //   if (themeMode == ThemeMode.light) return AppLightColorImpl();
  //   if (themeMode == ThemeMode.dark) return AppDarkColorImpl();
  //   throw 'No theme mode valid to init';
  // }
  abstract Color background;
  abstract Color surface;
  abstract Color primary;
  abstract Color secondary;
  abstract Color error;

  abstract Color onBackground;
  abstract Color onSurface;
  final Color onSurfaceVariant = Colors.grey;
  abstract Color onPrimary;
  abstract Color onSecondary;
  abstract Color onError;

  final sliderActive = const Color(0xffff8f00);
  final sliderInActive = const Color(0x26ff8f00);
  final splitBar = const Color(0xFF00B4AB);

  final answerActive = const Color(0xffffb703);
  final answerCorrect = Colors.green;
  abstract Color answerInActive;

// text
  abstract Color textPrimary;
  abstract Color textSecondary;
// icon
  final iconInactive = const Color(0xFFB4C1CC);

  final circularProgress = const Color(0xff40916c);
}
