import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../base_use_case/BaseUseCase.dart';

import '../../data/repositories/settings_repository/settings_repository.dart';

class GetThemeEnableUseCase implements BaseUseCase<ThemeMode, void> {
  final _repository = GetIt.I.get<SettingsRepository>();

  @override
  Future<ThemeMode> perform([_]) async {
    return await _repository.getThemeMode();
  }
}
