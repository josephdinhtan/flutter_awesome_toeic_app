import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

String numToStr(int num) {
  return num < 10 ? "0$num" : num.toString();
}

String _applicationDirectory = "";
String getApplicationDirectory() => _applicationDirectory;
void setApplicationDirectory(String appDir) => _applicationDirectory = appDir;

// quickly query thememode
ThemeMode _applicationThemeMode = ThemeMode.system;
ThemeMode getApplicationThemeMode() => _applicationThemeMode;
void setApplicationThemeMode(ThemeMode themeMode) =>
    _applicationThemeMode = themeMode;

ThemeMode getApplicationActiveThemeMode() {
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
