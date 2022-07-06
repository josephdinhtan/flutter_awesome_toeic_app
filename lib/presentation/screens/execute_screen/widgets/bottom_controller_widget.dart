import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core_ui/extensions/extensions.dart';
import '../../widgets/neumorphism_container.dart';

class BottomController extends StatelessWidget {
  BottomController({
    Key? key,
    this.isStandAlone = false,
    this.isFullTest = false,
    this.hasNote = false,
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
  bool isFullTest;
  bool hasNote;
  double iconSize = 26.w;

  @override
  Widget build(BuildContext context) {
    return NeumorphismContainer(
      removeShadow: isStandAlone ? false : true,
      removeBorder: !isStandAlone,
      color: context.colors.surfaceVariant,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: prevPressed,
              iconSize: iconSize,
              icon: Icon(
                CupertinoIcons.back,
                color: Theme.of(context)
                    .bottomNavigationBarTheme
                    .unselectedItemColor,
              ),
            ),
            if (!isFullTest)
              hasNote
                  ? IconButton(
                      onPressed: favoritePressed,
                      iconSize: iconSize,
                      icon: Icon(
                        CupertinoIcons.heart_fill,
                        color: context.colors.tertiary,
                      ),
                    )
                  : IconButton(
                      onPressed: favoritePressed,
                      iconSize: iconSize,
                      icon: Icon(
                        CupertinoIcons.heart,
                        color: Theme.of(context)
                            .bottomNavigationBarTheme
                            .unselectedItemColor,
                      ),
                    ),
            if (!isFullTest)
              IconButton(
                onPressed: checkAnsPressed,
                iconSize: iconSize,
                icon: Icon(
                  CupertinoIcons.checkmark_seal,
                  color: Theme.of(context)
                      .bottomNavigationBarTheme
                      .unselectedItemColor,
                ),
              ),
            IconButton(
              onPressed: nextPressed,
              iconSize: iconSize,
              icon: Icon(
                CupertinoIcons.forward,
                color: Theme.of(context)
                    .bottomNavigationBarTheme
                    .unselectedItemColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
