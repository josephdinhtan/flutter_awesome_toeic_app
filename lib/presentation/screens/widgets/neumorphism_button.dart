import 'package:flutter/material.dart';

import 'animations/animation_scale.dart' as animationScale;

class NeumorphismButton extends StatefulWidget {
  static const double PRESSED_SCALE = 0.98;
  static const double UNPRESSED_SCALE = 1.0;
  final Widget? child;
  final double borderRadius;
  final Function() onPressed;
  final Color backgroundColor;
  final bool isDarkMode;

  const NeumorphismButton({
    Key? key,
    this.child,
    this.borderRadius = 12,
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
              // boxShadow: !_pressed
              //     ? !widget.isDarkMode
              //         ? [
              //             BoxShadow(
              //               color: Colors.grey[500]!,
              //               //color: Colors.red!,
              //               offset: const Offset(2, 2),
              //               blurRadius: 6,
              //               spreadRadius: 0.1,
              //             ),
              //             const BoxShadow(
              //               color: Colors.white,
              //               offset: Offset(-2, -2),
              //               blurRadius: 6,
              //               spreadRadius: 1,
              //             )
              //           ]
              //         : const [
              //             BoxShadow(
              //               color: Color(0xFF001018),
              //               //color: Colors.red!,
              //               offset: Offset(2, 2),
              //               blurRadius: 6,
              //               spreadRadius: 0.1,
              //             ),
              //             BoxShadow(
              //               color: Color(0xFF001018),
              //               offset: Offset(-2, -2),
              //               blurRadius: 6,
              //               spreadRadius: 1,
              //             )
              //           ]
              //     : null,
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
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
