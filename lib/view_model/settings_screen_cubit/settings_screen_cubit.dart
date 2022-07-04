import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../core_ui/theme/theme.dart';
import '../../domain/user_settings_use_case/set_theme_color_use_case.dart';
import '../../domain/user_settings_use_case/set_theme_mode_use_case.dart';

part 'settings_screen_state.dart';

class SettingsScreenCubit extends Cubit<SettingsScreenState> {
  SettingsScreenCubit() : super(SettingsScreenInitial());

  void saveThemeMode(ThemeMode themeMode) {
    GetIt.I.get<SetThemeModeUseCase>().perform(themeMode);
  }

  void saveThemeColor(ThemeColor themeColor) {
    GetIt.I.get<SetThemeColorUseCase>().perform(themeColor);
  }
}
