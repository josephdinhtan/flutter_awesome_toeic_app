import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'part_seven_state.dart';

class PartSevenCubit extends Cubit<PartSevenState> {
  PartSevenCubit() : super(PartSevenInitial());
}
