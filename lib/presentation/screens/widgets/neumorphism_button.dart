import 'package:flutter/material.dart';
import 'animations/animation_scale.dart' as animationScale;

class NeumorphismButton extends StatefulWidget {
  static const double PRESSED_SCALE = 0.98;
  static const double UNPRESSED_SCALE = 1.0;
  final Widget? child;

  const NeumorphismButton({
    Key? key,
    this.child,
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
        onTapUp: (detail) {
          setState(() {
            _pressed = false;
          });
        },
        child: animationScale.AnimatedScale(
          scale: _getScale(),
          child: AnimatedContainer(
            width: 30,
            duration: const Duration(milliseconds: 100),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50.0),
                boxShadow: !_pressed
                    ? [
                        BoxShadow(
                          color: Colors.grey[500]!,
                          offset: const Offset(4, 4),
                          blurRadius: 15,
                          spreadRadius: 1,
                        ),
                        const BoxShadow(
                          color: Colors.white,
                          offset: Offset(-4, -4),
                          blurRadius: 15,
                          spreadRadius: 1,
                        )
                      ]
                    : null),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
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
