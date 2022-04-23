import '../../models/part_models/answer_enum.dart';
import '../../models/part_models/part_five_model.dart';

class PartFiveApi {
  Future<List<PartFiveModel>> getQuestionList() async {
    final List<PartFiveModel> demoResult = [];

    demoResult.add(PartFiveModel(
      questionNumber: 1,
      question: 'Question demo 1',
      answers: ['A. Ans A', 'B. Ans B', 'C. Ans C', 'D. Ans D'],
      correctAnswer: Answer.A,
    ));
    demoResult.add(PartFiveModel(
      questionNumber: 2,
      question: 'Question demo 2',
      answers: ['A. Ans A', 'B. Ans B', 'C. Ans C', 'D. Ans D'],
      correctAnswer: Answer.A,
    ));
    demoResult.add(PartFiveModel(
      questionNumber: 3,
      question: 'Question demo 3',
      answers: ['A. Ans A', 'B. Ans B', 'C. Ans C', 'D. Ans D'],
      correctAnswer: Answer.A,
    ));
    demoResult.add(PartFiveModel(
      questionNumber: 4,
      question: 'Question demo 4',
      answers: ['A. Ans A', 'B. Ans B', 'C. Ans C', 'D. Ans D'],
      correctAnswer: Answer.A,
    ));
    demoResult.add(PartFiveModel(
      questionNumber: 5,
      question: 'Question demo 5',
      answers: ['A. Ans A', 'B. Ans B', 'C. Ans C', 'D. Ans D'],
      correctAnswer: Answer.A,
    ));
    demoResult.add(PartFiveModel(
      questionNumber: 6,
      question: 'Question demo 6',
      answers: ['A. Ans A', 'B. Ans B', 'C. Ans C', 'D. Ans D'],
      correctAnswer: Answer.A,
    ));
    await Future.delayed(const Duration(milliseconds: 1000));
    return Future.value(demoResult);
  }
}
