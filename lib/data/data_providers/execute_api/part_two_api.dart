import '../../models/part_models/answer_enum.dart';
import '../../models/part_models/part_two_model.dart';

class PartTwoApi {
  Future<List<PartTwoModel>> getQuestionList() async {
    final List<PartTwoModel> demoResult = [];

    demoResult.add(PartTwoModel(
      questionNumber: 1,
      numOfQuestion: 6,
      soundUrl: 'this is a sound url 1',
      answers: ['A. Ans A', 'B. Ans B', 'C. Ans C', 'D. Ans D'],
      correctAnswer: Answer.A,
    ));
    demoResult.add(PartTwoModel(
      questionNumber: 2,
      numOfQuestion: 6,
      soundUrl: 'this is a sound url 2',
      answers: ['A. Ans A', 'B. Ans B', 'C. Ans C', 'D. Ans D'],
      correctAnswer: Answer.A,
    ));
    demoResult.add(PartTwoModel(
      questionNumber: 3,
      numOfQuestion: 6,
      soundUrl: 'this is a sound url 3',
      answers: ['A. Ans A', 'B. Ans B', 'C. Ans C', 'D. Ans D'],
      correctAnswer: Answer.A,
    ));
    demoResult.add(PartTwoModel(
      questionNumber: 4,
      numOfQuestion: 6,
      soundUrl: 'this is a sound url 4',
      answers: ['A. Ans A', 'B. Ans B', 'C. Ans C', 'D. Ans D'],
      correctAnswer: Answer.A,
    ));
    demoResult.add(PartTwoModel(
      questionNumber: 5,
      numOfQuestion: 6,
      soundUrl: 'this is a sound url 5',
      answers: ['A. Ans A', 'B. Ans B', 'C. Ans C', 'D. Ans D'],
      correctAnswer: Answer.A,
    ));
    demoResult.add(PartTwoModel(
      questionNumber: 6,
      numOfQuestion: 6,
      soundUrl: 'this is a sound url 6',
      answers: ['A. Ans A', 'B. Ans B', 'C. Ans C', 'D. Ans D'],
      correctAnswer: Answer.A,
    ));
    await Future.delayed(const Duration(milliseconds: 1000));
    return Future.value(demoResult);
  }
}
