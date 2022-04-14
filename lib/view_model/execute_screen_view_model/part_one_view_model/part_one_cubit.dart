import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/part_models/answer_enum.dart';
import '../../../data/models/part_models/part_one_model.dart';

part 'part_one_state.dart';

class PartOneCubit extends Cubit<PartOneState> {
  PartOneCubit() : super(PartOneInitial());

  Future<void> getContent() async {
    emit(PartOneLoading());
    final demoResult = PartOneModel(
      questionNumber: 2,
      title: 'Question 02/06',
      imageUrl: 'this is a image url',
      soundUrl: 'this is a sound url',
      answers: ['A. Ans A', 'B. Ans B', 'C. Ans C', 'D. Ans D'],
      correctAnswer: Answer.A,
    );
    await Future.delayed(const Duration(milliseconds: 1000));
    emit(PartOneContentLoaded(partOneModel: demoResult));
  }
}
