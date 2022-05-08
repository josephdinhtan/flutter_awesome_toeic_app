import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(HomeScreenInitial());

  ThemeMode currentThemeMode = ThemeMode.light;

  void changeTheme(ThemeMode themeMode) {
    currentThemeMode = themeMode;
    emit(HomeScreenThemeModeChange(themeMode: themeMode));
  }

  ThemeMode getThemeMode() => currentThemeMode;
}
