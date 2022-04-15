import '../../models/part_models/answer_enum.dart';
import '../../models/part_models/part_one_model.dart';

class PartOneApi {

  Future<PartOneModel> getContent() async {
    final demoResult = PartOneModel(
      questionNumber: 2,
      numOfQuestion: 6,
      imageUrl: 'this is a image url 2',
      soundUrl: 'this is a sound url 2',
      answers: ['A. Ans A', 'B. Ans B', 'C. Ans C', 'D. Ans D'],
      correctAnswer: Answer.A,
    );
    await Future.delayed(const Duration(milliseconds: 1000));
    return Future.value(demoResult);
  }
}