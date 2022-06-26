import 'package:flutter/material.dart';
import 'package:flutter_toeic_quiz2/core_ui/constants/app_colors/app_color.dart';

class AppDarkColorImpl extends AppColor {
  @override
  Color background = const Color(0xFF181C1D);
  @override
  Color surface = const Color(0xFF202A2E);
  @override
  Color primary = const Color(0xFF202A2E);
  @override
  Color secondary = const Color(0xFFFAAB1A);
  @override
  Color error = Colors.red;

  @override
  Color onBackground = Colors.black;
  @override
  Color onSurface = const Color(0xFFFFFFFF);
  @override
  Color onPrimary = const Color(0xFFFFFFFF);
  @override
  Color onSecondary = const Color(0xFF17262A);
  @override
  Color onError = const Color(0xFFFFFFFF);

  @override
  Color textPrimary = Colors.white;
  @override
  Color textSecondary = Colors.grey; //surface

  // inApp

  @override
  Color answerInActive = const Color(0xFF202A2E);
}
