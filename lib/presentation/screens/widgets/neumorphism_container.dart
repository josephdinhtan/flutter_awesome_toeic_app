import 'package:flutter/material.dart';

import '../../../core_ui/extensions/extensions.dart';

class NeumorphismContainer extends StatelessWidget {
  final Color color;
  final Widget? child;
  final bool removeShadow;
  final bool removeBorder;

  BorderRadiusGeometry borderRadiusGeometry = BorderRadius.only(
      topLeft: Radius.circular(12.r), topRight: Radius.circular(12.r));

  NeumorphismContainer({
    Key? key,
    this.removeShadow = false,
    this.color = Colors.white,
    this.removeBorder = false,
    this.child,
  }) : super(key: key) {
    if (removeBorder) {
      borderRadiusGeometry = BorderRadius.zero;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadiusGeometry,
          boxShadow: removeShadow
              ? null
              : [
                  BoxShadow(
                    color: Colors.grey[500]!,
                    //color: Colors.red!,
                    offset: const Offset(2, 2),
                    blurRadius: 6,
                    spreadRadius: 0.1,
                  ),
                  const BoxShadow(
                    color: Colors.white,
                    offset: Offset(-2, -2),
                    blurRadius: 6,
                    spreadRadius: 1,
                  )
                ]),
    );
  }
}
