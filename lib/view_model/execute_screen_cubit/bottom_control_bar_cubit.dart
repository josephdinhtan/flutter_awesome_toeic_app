import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bottom_control_bar_state.dart';

class BottomControlBarCubit extends Cubit<BottomControlBarState> {
  BottomControlBarCubit() : super(BottomControlBarInitial());

  void questionChange({required String? note, required bool userChecked}) {
    emit(BottomControlBarChange(note: note, userChecked: userChecked));
  }
}
