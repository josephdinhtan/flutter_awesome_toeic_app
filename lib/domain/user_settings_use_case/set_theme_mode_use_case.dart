import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../data/repositories/settings_repository/settings_repository.dart';
import '../base_use_case/BaseUseCase.dart';

class SetThemeModeUseCase implements BaseUseCase<bool, ThemeMode> {
  final _repository = GetIt.I.get<SettingsRepository>();

  @override
  Future<bool> perform(themeMode) async {
    return await _repository.setThemeMode(themeMode);
  }
}
