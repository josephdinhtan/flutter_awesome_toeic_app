import 'package:flutter/material.dart';
import 'package:flutter_toeic_quiz2/core/constants/app_colors.dart';

class AppLightTheme {
  const AppLightTheme._();
  static final themeData = ThemeData(
    scaffoldBackgroundColor: AppColors.kBackgroundLightColor,
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.kSurfaceNavigatorLightColor,
      unselectedItemColor: AppColors.kUnSelectedLightColor,
      selectedItemColor: AppColors.kSelectedLightColor,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.kSurfaceNavigatorLightColor,
      foregroundColor: Color(0xFF414B5A),
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
          color: AppColors.kOnSurfaceLightColorText,
          fontWeight: FontWeight.bold,
          fontSize: 20.0),
      bodyText2: TextStyle(color: AppColors.kOnSurfaceLightColorText2, fontSize: 15.0),
      button: TextStyle(
        color: AppColors.kOnPrimaryLightColor,
        fontSize: 15.0,
        fontWeight: FontWeight.bold,
      ),
      headline3: TextStyle(
          color: AppColors.kOnSurfaceLightColorText,
          fontWeight: FontWeight.bold,
          fontSize: 15.0),
      headline4: TextStyle(
          color: AppColors.kOnSurfaceDarkColorText2,
          fontWeight: FontWeight.bold,
          fontSize: 15.0),
      headline6: TextStyle(
        color: AppColors.kOnSurfaceLightColorText,
      ),
    ),
  );
}
