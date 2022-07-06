import 'package:flutter/material.dart';

import '../../../core_ui/extensions/extensions.dart';
import 'animations/animation_scale.dart' as animationScale;

class NeumorphismButton extends StatefulWidget {
  static const double PRESSED_SCALE = 0.98;
  static const double UNPRESSED_SCALE = 1.0;
  final Widget? child;
  final Function() onPressed;
  final Color backgroundColor;
  final bool isDarkMode;
  double borderRadius = 12.r;

  NeumorphismButton({
    Key? key,
    this.child,
    this.backgroundColor = Colors.white,
    this.isDarkMode = false,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<NeumorphismButton> createState() => _NeumorphismButtonState();
}

class _NeumorphismButtonState extends State<NeumorphismButton> {
  bool _pressed = false; //nu

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTapDown: (details) {
          setState(() {
            _pressed = true;
          });
        },
        onTapCancel: () {
          setState(() {
            _pressed = false;
          });
        },
        onTapUp: (detail) {
          setState(() {
            _pressed = false;
          });
          widget.onPressed();
        },
        child: animationScale.AnimatedScale(
          scale: _getScale(),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            decoration: BoxDecoration(
              color: widget.backgroundColor,
              borderRadius: BorderRadius.circular(widget.borderRadius),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.w),
              child: widget.child,
            ),
          ),
        ));
  }

  double _getScale() {
    return _pressed
        ? NeumorphismButton.PRESSED_SCALE
        : NeumorphismButton.UNPRESSED_SCALE;
  }
}
