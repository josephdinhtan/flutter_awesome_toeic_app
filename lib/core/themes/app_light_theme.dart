import 'package:flutter/material.dart';
import 'package:flutter_toeic_quiz2/core/constants/app_light_colors.dart';
import 'package:flutter_toeic_quiz2/core/constants/app_text_styles.dart';

import '../constants/app_dimensions.dart';

class AppLightTheme {
  const AppLightTheme._();

  static final themeData = ThemeData(
    scaffoldBackgroundColor: AppLightColors.kBackground,
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppLightColors.kButtonPrimary,
      foregroundColor: AppLightColors.kButtonTextPrimary,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppLightColors.kPrimary,
      unselectedItemColor: AppLightColors.kIconUnSelectedColor,
      selectedItemColor: AppLightColors.kIconSelectedColor,
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: AppLightColors.kPrimary,
      foregroundColor: AppLightColors.kTextPrimary,
    ),
    iconTheme: const IconThemeData(
      color: AppLightColors.kIconUnSelectedColor,
    ),
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(
        borderRadius:
        BorderRadius.circular(AppDimensions.kCardRadiusDefault),
      ),
      elevation: AppDimensions.kCardElevationDefaut,
    ),
    textTheme: const TextTheme(
      button: TextStyle(
        color: AppLightColors.kButtonTextPrimary,
        fontSize: 15.0,
        fontWeight: FontWeight.bold,
      ),
      headline3: AppTextStyles.kTextPrimary,
      headline4: AppTextStyles.kTextSecondary,
      headline5: AppTextStyles.kTextSecondaryThin,
      headline6: TextStyle(
        color: AppLightColors.kTextPrimary,
      ),
    ),
  );
}
