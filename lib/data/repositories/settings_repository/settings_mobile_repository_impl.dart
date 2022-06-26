import 'package:flutter/material.dart';
import 'package:flutter_toeic_quiz2/data/data_providers/hive_objects/settings_hive_object/settings_hive_object.dart';
import 'package:get_it/get_it.dart';

import '../../data_providers/daos/settings_dao/settings_dao.dart';
import 'settings_repository.dart';

class SettingsMobileRepositoryImpl implements SettingsRepository {
  final _dao = GetIt.I.get<SettingsDao>();
  final _id_box_user_settings = "app_user_settings";

  @override
  Future<ThemeMode> getThemeMode() async {
    final settings = await _dao.query(_id_box_user_settings);
    if (settings == null) {
      return ThemeMode.system;
    }
    return settings.themeMode;
  }

  @override
  Future<bool> setThemeMode(ThemeMode theme) async {
    final settings = await _dao.query(_id_box_user_settings);
    if (settings == null) {
      return await _dao.insert(
          SettingsHiveObject.fromDefault(_id_box_user_settings),
          'app_user_settings');
    } else {
      settings.themeMode = theme;
      return await _dao.insert(settings.toHiveObject(), _id_box_user_settings);
    }
  }
}
