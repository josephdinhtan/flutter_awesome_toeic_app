import 'package:flutter/material.dart';
import 'package:flutter_toeic_quiz2/core_ui/extensions/extensions.dart';

import '../../../../../core_ui/theme/theme.dart';

enum ColorEnum {
  grey,
  pink,
  blue,
  green,
  orange,
  purple,
}

List<ThemeColor> _themeColorList = [
  ThemeColor(name: 'Black', color: Colors.black),
  ThemeColor(name: 'Grey', color: Colors.grey),
  ThemeColor(name: 'Pink', color: Colors.pink),
  ThemeColor(name: 'Blue', color: Colors.blue),
  ThemeColor(name: 'Green', color: Colors.green),
  ThemeColor(name: 'Orange', color: Colors.orange),
  ThemeColor(name: 'Purple', color: Colors.purple),
];

class ColorPicker extends StatefulWidget {
  ColorPicker({
    super.key,
    required this.themeColor,
    required this.themeColorChange,
  });

  ThemeColor themeColor;
  final Function(ThemeColor) themeColorChange;

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  _colorChange(ThemeColor themeColor) {
    widget.themeColorChange(themeColor);
    setState(() {
      widget.themeColor = themeColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return ColorPickerPanel(
                availableColors: _themeColorList,
                initialColor: widget.themeColor.color,
                onSelectColor: (value) {
                  _colorChange(value);
                },
              );
            });
      },
      child: Container(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Color', style: context.titleSmall),
              Row(
                children: [
                  Text(
                    widget.themeColor.name,
                    style: context.labelMedium!.copyWith(color: Colors.grey),
                  ),
                  const SizedBox(width: 8.0),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 16.0,
                    color: Colors.grey,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ColorPickerPanel extends StatefulWidget {
  ColorPickerPanel({
    Key? key,
    required this.availableColors,
    required this.onSelectColor,
    required this.initialColor,
    this.circleItem = true,
  }) : super(key: key);

  final List<ThemeColor> availableColors;
  final Function onSelectColor;
  final bool circleItem;
  final Color initialColor;

  @override
  State<ColorPickerPanel> createState() => _ColorPickerPanelState();
}

class _ColorPickerPanelState extends State<ColorPickerPanel> {
  ColorEnum? _colorEnum;
  late Color _pickedColor;

  @override
  void initState() {
    super.initState();
    _pickedColor = widget.initialColor;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100.0,
      child: Center(
        child: ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (context, index) => const SizedBox(width: 8.0),
          scrollDirection: Axis.horizontal,
          itemCount: widget.availableColors.length,
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          itemBuilder: (context, index) {
            final itemColor = widget.availableColors[index];
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    widget.onSelectColor(itemColor);
                    setState(() {
                      _pickedColor = itemColor.color;
                    });
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: itemColor.color,
                      shape: widget.circleItem == true
                          ? BoxShape.circle
                          : BoxShape.rectangle,
                    ),
                    child: itemColor.color == _pickedColor
                        ? const Center(
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                            ),
                          )
                        : Container(),
                  ),
                ),
                Text(itemColor.name),
              ],
            );
          },
        ),
      ),
    );
  }
}
