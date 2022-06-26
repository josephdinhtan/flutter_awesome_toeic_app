import 'package:flutter/material.dart';
import 'package:flutter_toeic_quiz2/data/di/cubit_injection.dart';
import 'package:flutter_toeic_quiz2/domain/base_use_case/BaseUseCase.dart';
import 'package:get_it/get_it.dart';

import '../../data/repositories/settings_repository/settings_repository.dart';

class SetThemeEnableUseCase implements BaseUseCase<bool, ThemeMode> {
  final _repository = GetIt.I.get<SettingsRepository>();

  @override
  Future<bool> perform(themeMode) async {
    return await _repository.setThemeMode(themeMode);
  }
}
