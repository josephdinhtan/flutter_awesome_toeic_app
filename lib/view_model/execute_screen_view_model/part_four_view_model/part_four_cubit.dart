import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'part_four_state.dart';

class PartFourCubit extends Cubit<PartFourState> {
  PartFourCubit() : super(PartFourInitial());
}
