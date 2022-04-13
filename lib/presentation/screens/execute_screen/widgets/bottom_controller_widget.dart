
import 'package:flutter/material.dart';
import 'package:flutter_toeic_quiz2/core/constants/app_dark_colors.dart';
import 'package:flutter_toeic_quiz2/core/constants/app_light_colors.dart';

class BottomController extends StatelessWidget {
  BottomController({
    Key? key,
    required this.checkAnsPressed,
    required this.prePressed,
    required this.nextPressed,
  }) : super(key: key);

  Function()? nextPressed;
  Function()? prePressed;
  Function()? checkAnsPressed;

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Material(
      color: isDarkMode ? AppDarkColors.kSurface : AppLightColors.kPrimary,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: prePressed,
              icon: const Icon(
                Icons.arrow_back_ios_rounded,
              ),
            ),
            IconButton(
              onPressed: () {},
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
    );
  }
}
