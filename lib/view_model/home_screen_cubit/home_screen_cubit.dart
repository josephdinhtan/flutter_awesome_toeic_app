import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toeic_quiz2/core_utils/core_utils.dart';
import 'package:flutter_toeic_quiz2/domain/user_settings_use_case/set_theme_mode_use_case.dart';
import 'package:get_it/get_it.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(HomeScreenInitial());

  ThemeMode currentThemeMode = ThemeMode.light;

  void changeTheme(ThemeMode themeMode) {
    currentThemeMode = themeMode;
    GetIt.I.get<SetThemeModeUseCase>().perform(themeMode);
    setApplicationThemeMode(themeMode);
    emit(HomeScreenThemeModeChange(themeMode: themeMode));
  }

  ThemeMode getThemeMode() => currentThemeMode;
}
