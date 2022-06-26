import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../../core_ui/themes/theme.dart';

Map<String, Color> _colors = {
  'Grey': Colors.grey,
  'Pink': Colors.pink,
  'Blue': Colors.blue,
  'Green': Colors.green,
  'Orange': Colors.orange,
  'Purple': Colors.purple,
};

class ColorPicker extends StatefulWidget {
  ColorPicker({super.key});

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  String colorValue = 'Pink';
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: colorValue,
      items: <String>[
        'Grey',
        'Pink',
        'Blue',
        'Green',
        'Orange',
        'Purple',
      ].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (colorStr) {
        setState(() {
          colorValue = colorStr!;

          final themeProvider = ThemeProvider.of(context);
          final settings = themeProvider.settings.value;
          final newSettings = ThemeSettings(
            sourceColor: _colors[colorStr]!,
            themeMode: settings.themeMode,
          );
          ThemeSettingChange(settings: newSettings).dispatch(context);
        });
      },
    );
  }
}
