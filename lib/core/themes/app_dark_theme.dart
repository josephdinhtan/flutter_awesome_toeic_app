import 'package:flutter/material.dart';
import 'package:flutter_toeic_quiz2/core/constants/app_light_colors.dart';

class AppDarkTheme {
  const AppDarkTheme._();
  static final themeData = ThemeData(
    backgroundColor: Color(0xFF264653),

    primarySwatch: Colors.blue,

    visualDensity: VisualDensity.adaptivePlatformDensity,

    textTheme: const TextTheme(
      bodyText1: TextStyle(
          color: AppLightColors.kOnSurfaceColorText,
          fontWeight: FontWeight.bold,
          fontSize: 20.0),
      bodyText2: TextStyle(color: AppLightColors.kOnSurfaceColorText2, fontSize: 15.0),
      button: TextStyle(
        color: AppLightColors.kOnPrimary,
        fontSize: 15.0,
        fontWeight: FontWeight.bold,
      ),
      headline3: TextStyle(
          color: AppLightColors.kTextPrimary,
          fontWeight: FontWeight.bold,
          fontSize: 15.0),
      headline4: TextStyle(
          color: AppLightColors.kOnSurfaceColorText2,
          fontWeight: FontWeight.bold,
          fontSize: 15.0),
      headline6: TextStyle(
        color: AppLightColors.kOnSurfaceColorText,
      ),
    ),
  );
}
