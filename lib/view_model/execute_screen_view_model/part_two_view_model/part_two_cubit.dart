import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'part_two_state.dart';

class PartTwoCubit extends Cubit<PartTwoState> {
  PartTwoCubit() : super(PartTwoInitial());
}
