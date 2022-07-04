import 'package:flutter/material.dart';

import 'theme_color.dart';

class ThemeSettings {
  ThemeSettings({
    required this.themeColor,
    required this.themeMode,
  });
  final ThemeColor themeColor;
  final ThemeMode themeMode;

  ThemeSettings copyWith({ThemeColor? themeColor, ThemeMode? themeMode}) {
    return ThemeSettings(
      themeColor: themeColor ?? this.themeColor,
      themeMode: themeMode ?? this.themeMode,
    );
  }
}
