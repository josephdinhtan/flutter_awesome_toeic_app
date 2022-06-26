import 'package:flutter/material.dart';

import '../../business_models/part_model.dart';

abstract class SettingsRepository {
  Future<bool> setThemeMode(ThemeMode theme);
  Future<ThemeMode> getThemeMode();
}
