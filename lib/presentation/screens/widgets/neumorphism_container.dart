import 'package:flutter/material.dart';

class NeumorphismContainer extends StatelessWidget {
  final Color color;
  final BorderRadiusGeometry borderRadiusGeometry;
  final Widget? child;
  final bool removeShadow;

  const NeumorphismContainer(
      {Key? key,
      this.removeShadow = false,
      this.color = Colors.white,
      this.borderRadiusGeometry = const BorderRadius.only(
          topLeft: Radius.circular(12.0), topRight: Radius.circular(12.0)),
      this.child})
      : super(key: key);

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
