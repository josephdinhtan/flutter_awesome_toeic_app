import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'part_three_state.dart';

class PartThreeCubit extends Cubit<PartThreeState> {
  PartThreeCubit() : super(PartThreeInitial());
}
