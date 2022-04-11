import 'package:flutter/material.dart';
import 'package:flutter_toeic_quiz2/core/constants/app_colors.dart';

class AppDarkTheme {
  const AppDarkTheme._();
  static final themeData = ThemeData(
    backgroundColor: Color(0xFF264653),
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,

    textTheme: const TextTheme(
      bodyText1: TextStyle(
          color: AppColors.kOnSurfaceDarkColorText,
          fontWeight: FontWeight.bold,
          fontSize: 20.0),
      bodyText2: TextStyle(color: AppColors.kOnSurfaceDarkColorText2, fontSize: 15.0),
      button: TextStyle(
        color: AppColors.kOnPrimaryDarkColor,
        fontSize: 15.0,
        fontWeight: FontWeight.bold,
      ),
      headline3: TextStyle(
          color: AppColors.kOnSurfaceDarkColorText,
          fontWeight: FontWeight.bold,
          fontSize: 15.0),
      headline4: TextStyle(
          color: AppColors.kOnSurfaceDarkColorText2,
          fontWeight: FontWeight.bold,
          fontSize: 15.0),
      headline6: TextStyle(
        color: AppColors.kOnSurfaceDarkColorText,
      ),
    ),
  );
}
