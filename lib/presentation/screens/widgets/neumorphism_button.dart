import 'package:flutter/material.dart';

import 'animations/animation_scale.dart' as animationScale;

class NeumorphismButton extends StatefulWidget {
  static const double PRESSED_SCALE = 0.98;
  static const double UNPRESSED_SCALE = 1.0;
  final Widget? child;
  final double boderRadius;
  final Function() onPressed;
  final Color backgroundColor;

  const NeumorphismButton({
    Key? key,
    this.child,
    this.boderRadius = 12,
    this.backgroundColor = Colors.white,
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
                borderRadius: BorderRadius.circular(widget.boderRadius),
                boxShadow: !_pressed
                    ? [
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
                      ]
                    : null),
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
