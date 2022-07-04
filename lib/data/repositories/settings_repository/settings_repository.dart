import 'package:flutter/material.dart';
import 'package:flutter_toeic_quiz2/core_ui/theme/theme.dart';

import '../../business_models/part_model.dart';

abstract class SettingsRepository {
  Future<bool> setThemeMode(ThemeMode theme);
  Future<ThemeMode> getThemeMode();
  Future<bool> setThemeColor(ThemeColor themeColor);
  Future<ThemeColor> getThemeColor();
}
