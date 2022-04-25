import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_toeic_quiz2/core/constants/app_dark_colors.dart';
import 'package:flutter_toeic_quiz2/core/constants/app_light_colors.dart';

import '../../../../core/constants/app_neumorphic_style.dart';

class BottomControllerNeumorphic extends StatelessWidget {
  BottomControllerNeumorphic({
    Key? key,
    this.isStandAlone = false,
    required this.checkAnsPressed,
    required this.prevPressed,
    required this.nextPressed,
    required this.favoritePressed,
  }) : super(key: key);

  Function()? nextPressed;
  Function()? prevPressed;
  Function()? checkAnsPressed;
  Function()? favoritePressed;
  bool isStandAlone;

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Neumorphic(
      style: isStandAlone
          ? AppNeumorphicStyles.kCommonStyle
          : AppNeumorphicStyles.kBottomControllerStyle,
      child: Material(
        color: isDarkMode ? AppDarkColors.kBottomNavigationBackground : AppLightColors.kBottomNavigationBackground,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: prevPressed,
                icon: const Icon(
                  Icons.arrow_back_ios_rounded,
                ),
              ),
              IconButton(
                onPressed: favoritePressed,
                icon: const Icon(
                  Icons.favorite_border,
                ),
              ),
              IconButton(
                onPressed: checkAnsPressed,
                icon: const Icon(
                  Icons.fact_check_outlined,
                ),
              ),
              IconButton(
                onPressed: nextPressed,
                icon: const Icon(
                  Icons.arrow_forward_ios_rounded,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
