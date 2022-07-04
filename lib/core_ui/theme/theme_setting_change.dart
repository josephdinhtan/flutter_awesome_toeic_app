import 'package:flutter/material.dart';

import 'theme_settings.dart';

class ThemeSettingChange extends Notification {
  ThemeSettingChange({required this.settings});
  final ThemeSettings settings;
}
