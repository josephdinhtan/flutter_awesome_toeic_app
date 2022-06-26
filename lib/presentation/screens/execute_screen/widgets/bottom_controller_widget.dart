import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/neumorphism_container.dart';

class BottomController extends StatelessWidget {
  BottomController({
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
    return NeumorphismContainer(
      removeShadow: isStandAlone ? false : true,
      borderRadiusGeometry: isStandAlone
          ? const BorderRadius.only(
              topLeft: Radius.circular(12.0), topRight: Radius.circular(12.0))
          : BorderRadius.zero,
      color: Theme.of(context).bottomNavigationBarTheme.backgroundColor!,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: prevPressed,
              icon: Icon(
                CupertinoIcons.back,
                color: Theme.of(context)
                    .bottomNavigationBarTheme
                    .unselectedItemColor,
              ),
            ),
            IconButton(
              onPressed: favoritePressed,
              icon: Icon(
                CupertinoIcons.heart,
                color: Theme.of(context)
                    .bottomNavigationBarTheme
                    .unselectedItemColor,
              ),
            ),
            IconButton(
              onPressed: checkAnsPressed,
              icon: Icon(
                CupertinoIcons.doc_checkmark,
                color: Theme.of(context)
                    .bottomNavigationBarTheme
                    .unselectedItemColor,
              ),
            ),
            IconButton(
              onPressed: nextPressed,
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
