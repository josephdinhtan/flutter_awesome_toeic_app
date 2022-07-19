import 'package:flutter/material.dart';
import 'package:flutter_toeic_quiz2/core_ui/theme/theme_color.dart';

import 'settings_repository.dart';

class SettingsWebRepositoryImpl implements SettingsRepository {
  @override
  Future<ThemeMode> getThemeMode() {
    return Future.value(ThemeMode.light);
  }

  @override
  Future<bool> setThemeMode(ThemeMode theme) {
    // TODO: implement setThemeMode
    throw UnimplementedError();
  }

  @override
  Future<ThemeColor> getThemeColor() {
    // TODO: implement getDominantColor
    return Future.value(ThemeColor(name: 'Pink', color: Colors.pink));
    throw UnimplementedError();
  }

  @override
  Future<bool> setThemeColor(ThemeColor themeColor) {
    // TODO: implement setDominantColor
    throw UnimplementedError();
  }
}
