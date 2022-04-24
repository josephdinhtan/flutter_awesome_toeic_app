part of 'home_screen_cubit.dart';

abstract class HomeScreenState {}

class HomeScreenInitial extends HomeScreenState {}
class HomeScreenThemeModeChange extends HomeScreenState {
  ThemeMode themeMode;
  HomeScreenThemeModeChange({required this.themeMode});
}
