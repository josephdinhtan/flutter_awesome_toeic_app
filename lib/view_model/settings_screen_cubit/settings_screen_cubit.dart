import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'settings_screen_state.dart';

class SettingsScreenCubit extends Cubit<SettingsScreenState> {
  SettingsScreenCubit() : super(SettingsScreenInitial());
}
