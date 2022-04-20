import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_toeic_quiz2/core/constants/app_light_colors.dart';

class AppNeumorphicStyles {
  static NeumorphicStyle kCommonStyle = NeumorphicStyle(
    color: AppLightColors.kAnswerButtonColor,
    // depth: 5,
    // intensity: 0.75,
    shape: NeumorphicShape.flat,
    boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
  );

  static NeumorphicStyle kButtonStyle = NeumorphicStyle(
    color: AppLightColors.kButtonPrimary,
    // depth: 5,
    // intensity: 0.75,
    shape: NeumorphicShape.flat,
    boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
  );

  static NeumorphicStyle kAnswerButtonStyle = NeumorphicStyle(
    color: AppLightColors.kAnswerButtonColor,
    depth: 5,
    intensity: 0.75,
    shape: NeumorphicShape.flat,
    boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
  );

  static NeumorphicStyle kAudioControllerStyle = NeumorphicStyle(
    color: AppLightColors.kAnswerButtonColor,
    // depth: 5,
    // intensity: 0.75,
    shape: NeumorphicShape.flat,
    boxShape: NeumorphicBoxShape.roundRect(const BorderRadius.only(
        topLeft: Radius.circular(12.0), topRight: Radius.circular(12.0))),
  );

  static NeumorphicStyle kBottomControllerStyle = NeumorphicStyle(
    color: AppLightColors.kAnswerButtonColor,
    // depth: 5,
    // intensity: 0.75,
    shape: NeumorphicShape.flat,
    boxShape: NeumorphicBoxShape.roundRect(const BorderRadius.only(
        bottomLeft: Radius.circular(12.0), bottomRight: Radius.circular(12.0))),
  );
}
