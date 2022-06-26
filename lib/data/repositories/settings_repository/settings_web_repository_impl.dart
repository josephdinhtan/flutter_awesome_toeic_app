import 'package:flutter/src/material/app.dart';

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
}
