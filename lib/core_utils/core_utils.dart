import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_toeic_quiz2/core_ui/theme/theme.dart';

String numToStr(int num) {
  return num < 10 ? "0$num" : num.toString();
}

String _applicationDirectory = "";
String getApplicationDirectory() => _applicationDirectory;
void setApplicationDirectory(String appDir) => _applicationDirectory = appDir;

// Theme and color
ThemeColor _themeColorSetting = ThemeColor(name: 'Pink', color: Colors.pink);
ThemeColor getApplicationThemeColor() => _themeColorSetting;
void setApplicationThemeColor(ThemeColor themeColor) =>
    _themeColorSetting = themeColor;

// quickly query Theme Mode
ThemeMode _applicationThemeMode = ThemeMode.system;
ThemeMode getApplicationThemeMode() => _applicationThemeMode;
void setApplicationThemeMode(ThemeMode themeMode) =>
    _applicationThemeMode = themeMode;

ThemeMode getApplicationBrightness() {
  if (_applicationThemeMode != ThemeMode.system) {
    return _applicationThemeMode;
  } else {
    var brightness = SchedulerBinding.instance.window.platformBrightness;
    if (brightness == Brightness.dark) {
      return ThemeMode.dark;
    } else {
      return ThemeMode.light;
    }
  }
}
