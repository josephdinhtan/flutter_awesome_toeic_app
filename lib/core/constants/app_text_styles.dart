import 'package:flutter/material.dart';
import 'package:flutter_toeic_quiz2/core/constants/app_light_colors.dart';

class AppTextStyles {
  static const kTempTextStyle = TextStyle(
    fontFamily: 'Spartan MB',
    fontSize: 100.0,
  );

  static const kMessageTextStyle = TextStyle(
    fontFamily: 'Spartan MB',
    fontSize: 60.0,
  );

  static const kButtonTextStyle = TextStyle(
    fontSize: 30.0,
    fontFamily: 'Spartan MB',
  );

  static const kConditionTextStyle = TextStyle(
    fontSize: 100.0,
  );

  //TextPrimary
  static const kTextPrimary = TextStyle(
    color: AppLightColors.kTextPrimary,
    fontWeight: FontWeight.bold,
    fontSize: 20.0,
  );

  //TextSecondary
  static const kTextSecondary = TextStyle(
    color: AppLightColors.kTextSecondary,
    fontWeight: FontWeight.bold,
    fontSize: 15.0,
  );
  static const kTextSecondaryThin = TextStyle(
    color: AppLightColors.kTextSecondary,
    fontWeight: FontWeight.normal,
    fontSize: 12.0,
  );

  //execute test
  static const kTextAnswerBoard = TextStyle(
      color: AppLightColors.kTextAnswerBoard,
      fontSize: 16.0,
      fontWeight: FontWeight.w400);
  static const kTextQuestion = TextStyle(
    color: AppLightColors.kTextQuestion,
    fontWeight: FontWeight.bold,
    fontSize: 16.0,
  );
}
