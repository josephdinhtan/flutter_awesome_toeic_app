// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'bottom_control_bar_cubit.dart';

@immutable
abstract class BottomControlBarState {}

class BottomControlBarInitial extends BottomControlBarState {}

class BottomControlBarChange extends BottomControlBarState {
  final String? note;
  final bool userChecked;
  BottomControlBarChange({
    required this.note,
    required this.userChecked,
  });
}
