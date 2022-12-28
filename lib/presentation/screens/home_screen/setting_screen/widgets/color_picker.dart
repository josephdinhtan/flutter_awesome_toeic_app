import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core_ui/extensions/extensions.dart';
import '../../../../../core_ui/theme/theme.dart';
import 'settings_title.dart';

List<ThemeColor> _themeColorList = [
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
    return SettingsTile(
        leadingIconData: Icons.color_lens_outlined,
        titleText: 'Color',
        value: Text(widget.themeColor.name,
            style: context.titleMedium!
                .copyWith(fontWeight: FontWeight.w600, color: Colors.grey)),
        onPressed: () {
          showCupertinoModalPopup(
              context: context,
              builder: (context) {
                return CupertinoActionSheet(
                  cancelButton: CupertinoDialogAction(
                    /// This parameter indicates the action would perform
                    /// a destructive action such as delete or exit and turns
                    /// the action's text color to red.
                    isDestructiveAction: true,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'),
                  ),
                  message: ColorPickerPanel(
                    availableColors: _themeColorList,
                    initialColor: widget.themeColor.color,
                    onSelectColor: (value) {
                      _colorChange(value);
                    },
                  ),
                );
              });
        });
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
  late Color _pickedColor;

  @override
  void initState() {
    super.initState();
    _pickedColor = widget.initialColor;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: Center(
        child: ListView.separated(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          shrinkWrap: true,
          separatorBuilder: (context, index) => SizedBox(width: 12.w),
          scrollDirection: Axis.horizontal,
          itemCount: widget.availableColors.length,
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          itemBuilder: (context, index) {
            final itemColor = widget.availableColors[index];
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    widget.onSelectColor(itemColor);
                    setState(() {
                      _pickedColor = itemColor.color;
                    });
                  },
                  child: Container(
                    width: 40.w,
                    height: 40.w,
                    decoration: BoxDecoration(
                      color: itemColor.color,
                      shape: widget.circleItem == true
                          ? BoxShape.circle
                          : BoxShape.rectangle,
                    ),
                    child: itemColor.color == _pickedColor
                        ? Center(
                            child: Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 20.w,
                            ),
                          )
                        : Container(),
                  ),
                ),
                Text(
                  itemColor.name,
                  style: context.labelMedium,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
