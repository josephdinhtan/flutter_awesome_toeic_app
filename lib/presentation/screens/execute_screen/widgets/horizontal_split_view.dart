import 'package:flutter/material.dart';
import 'package:flutter_toeic_quiz2/core_ui/extensions/extensions.dart';

class HorizontalSplitView extends StatefulWidget {
  final Widget up;
  final Widget bottom;
  final double ratio;
  final Color color;

  const HorizontalSplitView(
      {Key? key,
      required this.up,
      required this.bottom,
      this.ratio = 0.5,
      this.color = const Color(0xFF00B4AB)})
      : assert(ratio >= 0),
        assert(ratio <= 1),
        super(key: key);

  @override
  _HorizontalSplitViewState createState() => _HorizontalSplitViewState();
}

class _HorizontalSplitViewState extends State<HorizontalSplitView> {
  double _dividerHeight = 24.0;
  final _dividerVisibleHeight = 2.0;

  //from 0-1
  late double _ratio;
  late double _maxHeight;

  get _height1 => _ratio * _maxHeight;

  get _height2 => (1 - _ratio) * _maxHeight;

  @override
  void initState() {
    super.initState();
    _ratio = widget.ratio;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, BoxConstraints constraints) {
        _maxHeight = constraints.maxHeight - _dividerHeight;
        if (_maxHeight != constraints.maxHeight) {
          _maxHeight = constraints.maxHeight - _dividerHeight;
        }
        return SizedBox(
          height: constraints.maxHeight,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: _height1,
                child: widget.up,
              ),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                child: Container(
                  height: _dividerHeight,
                  width: constraints.maxWidth,
                  color: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: _dividerVisibleHeight,
                        color: widget.color,
                      ),
                    ],
                  ),
                ),
                onPanUpdate: (DragUpdateDetails details) {
                  setState(() {
                    _ratio += details.delta.dy / _maxHeight;
                    if (_ratio > 0.9) {
                      _ratio = 0.9;
                    } else if (_ratio < 0.1) {
                      _ratio = 0.1;
                    }
                  });
                },
              ),
              SizedBox(
                height: _height2,
                child: widget.bottom,
              ),
            ],
          ),
        );
      },
    );
  }
}
