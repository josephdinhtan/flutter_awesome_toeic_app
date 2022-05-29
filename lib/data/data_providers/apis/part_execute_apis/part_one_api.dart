
import '../../../business_models/part_models/answer_enum.dart';
import '../../../business_models/part_models/part_one_model.dart';

class PartOneApi {
  Future<List<PartOneModel>> getQuestionList() async {
    final List<PartOneModel> demoResult = [];

    demoResult.add(PartOneModel(
      questionNumber: 1,
      numOfQuestion: 6,
      imageUrl: 'this is a image url 1',
      soundUrl: 'this is a sound url 1',
      answers: ['A. Ans A', 'B. Ans B', 'C. Ans C', 'D. Ans D'],
      correctAnswer: Answer.A,
    ));
    demoResult.add(PartOneModel(
      questionNumber: 2,
      numOfQuestion: 6,
      imageUrl: 'this is a image url 2',
      soundUrl: 'this is a sound url 2',
      answers: ['A. Ans A', 'B. Ans B', 'C. Ans C', 'D. Ans D'],
      correctAnswer: Answer.A,
    ));
    demoResult.add(PartOneModel(
      questionNumber: 3,
      numOfQuestion: 6,
      imageUrl: 'this is a image url 3',
      soundUrl: 'this is a sound url 3',
      answers: ['A. Ans A', 'B. Ans B', 'C. Ans C', 'D. Ans D'],
      correctAnswer: Answer.A,
    ));
    demoResult.add(PartOneModel(
      questionNumber: 4,
      numOfQuestion: 6,
      imageUrl: 'this is a image url 4',
      soundUrl: 'this is a sound url 4',
      answers: ['A. Ans A', 'B. Ans B', 'C. Ans C', 'D. Ans D'],
      correctAnswer: Answer.A,
    ));
    demoResult.add(PartOneModel(
      questionNumber: 5,
      numOfQuestion: 6,
      imageUrl: 'this is a image url 5',
      soundUrl: 'this is a sound url 5',
      answers: ['A. Ans A', 'B. Ans B', 'C. Ans C', 'D. Ans D'],
      correctAnswer: Answer.A,
    ));
    demoResult.add(PartOneModel(
      questionNumber: 6,
      numOfQuestion: 6,
      imageUrl: 'this is a image url 6',
      soundUrl: 'this is a sound url 6',
      answers: ['A. Ans A', 'B. Ans B', 'C. Ans C', 'D. Ans D'],
      correctAnswer: Answer.A,
    ));
    await Future.delayed(const Duration(milliseconds: 1000));
    return Future.value(demoResult);
  }
}
