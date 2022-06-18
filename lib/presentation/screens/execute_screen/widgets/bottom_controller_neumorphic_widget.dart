import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core_ui/constants/app_dark_colors.dart';
import '../../../../core_ui/constants/app_light_colors.dart';
import '../../../../view_model/home_screen_cubit/home_screen_cubit.dart';
import '../../widgets/neumorphism_container.dart';

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
    bool isDarkMode =
        BlocProvider.of<HomeScreenCubit>(context).getThemeMode() ==
            ThemeMode.dark;
    return NeumorphismContainer(
      borderRadiusGeometry: isStandAlone
          ? const BorderRadius.only(
              topLeft: Radius.circular(12.0), topRight: Radius.circular(12.0))
          : BorderRadius.zero,
      color: isDarkMode
          ? AppDarkColors.kNavigationBar
          : AppLightColors.kNavigationBar,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: prevPressed,
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: isDarkMode
                    ? AppDarkColors.kIconColor
                    : AppLightColors.kIconColor,
              ),
            ),
            IconButton(
              onPressed: favoritePressed,
              icon: Icon(
                Icons.favorite_border,
                color: isDarkMode
                    ? AppDarkColors.kIconColor
                    : AppLightColors.kIconColor,
              ),
            ),
            IconButton(
              onPressed: checkAnsPressed,
              icon: Icon(
                Icons.fact_check_outlined,
                color: isDarkMode
                    ? AppDarkColors.kIconColor
                    : AppLightColors.kIconColor,
              ),
            ),
            IconButton(
              onPressed: nextPressed,
              icon: Icon(
                Icons.arrow_forward_ios_rounded,
                color: isDarkMode
                    ? AppDarkColors.kIconColor
                    : AppLightColors.kIconColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
