import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_toeic_quiz2/core_utils/global_configuration.dart';
import 'package:get_it/get_it.dart';

import '../../../core_ui/theme/theme_color.dart';
import '../../data_providers/daos/settings_dao/settings_dao.dart';
import 'settings_repository.dart';

const _logTag = 'SettingsMobileRepositoryImpl';

class SettingsMobileRepositoryImpl implements SettingsRepository {
  final _dao = GetIt.I.get<SettingsDao>();
  final keyThemeMode = "app_theme_mode";
  final keyThemeColorValue = "app_theme_color_v";
  final keyThemeColorName = "app_theme_color_n";

  @override
  Future<ThemeMode> getThemeMode() async {
    final themeModeIndex = await _dao.query(keyThemeMode);
    if (themeModeIndex == null) {
      return ThemeMode.system;
    }
    if (logEnable) {
      log('$_logTag getThemeMode() themeModeIndex: $themeModeIndex');
    }
    return ThemeMode.values[themeModeIndex];
  }

  @override
  Future<bool> setThemeMode(ThemeMode themeMode) async {
    return await _dao.insert(themeMode.index, keyThemeMode);
  }

  @override
  Future<ThemeColor> getThemeColor() async {
    final themeColorValue = await _dao.query(keyThemeColorValue);
    final themeColorName = await _dao.query(keyThemeColorName);
    if (themeColorValue == null) {
      return ThemeColor(name: 'Pink', color: Colors.pink);
    }
    if (logEnable) log('$_logTag getThemeColor() colorName: $themeColorName');
    return ThemeColor(color: Color(themeColorValue), name: themeColorName);
  }

  @override
  Future<bool> setThemeColor(ThemeColor themeColor) async {
    final valueDone =
        await _dao.insert(themeColor.color.value, keyThemeColorValue);
    final nameDone = await _dao.insert(themeColor.name, keyThemeColorName);
    if (logEnable) {
      log('$_logTag setThemeColor() colorName: ${themeColor.name}, result: ${valueDone && nameDone}');
    }

    return valueDone && nameDone;
  }
}
