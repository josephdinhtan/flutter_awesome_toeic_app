

import '../../../business_models/part_models/answer_enum.dart';
import '../../../business_models/part_models/part_three_model.dart';

class PartThreeApi {
  Future<List<PartThreeModel>> getQuestionList() async {
    final List<PartThreeModel> demoResult = [];

    demoResult.add(PartThreeModel(
        questions: [
          'Question demo part 3 - 1',
          'Question demo part 3 - 2',
          'Question demo part 3 - 3',
        ],
        questionNumber: [40, 41, 42],
        soundUrl: 'Sound URL part 3 demo - 1',
        answers: [
          ['answer demo A', 'answer demo B', 'answer demo C', 'answer demo D'],
          ['answer demo A', 'answer demo B', 'answer demo C', 'answer demo D'],
          ['answer demo A', 'answer demo B', 'answer demo C', 'answer demo D']
        ],
        correctAnswer: [Answer.A, Answer.B, Answer.C]));
    demoResult.add(PartThreeModel(
        questions: [
          'Question demo part 3 - 4',
          'Question demo part 3 - 5',
          'Question demo part 3 - 6',
        ],
        questionNumber: [43, 44, 45],
        soundUrl: 'Sound URL part 3 demo - 2',
        answers: [
          ['answer demo A', 'answer demo B', 'answer demo C', 'answer demo D'],
          ['answer demo A', 'answer demo B', 'answer demo C', 'answer demo D'],
          ['answer demo A', 'answer demo B', 'answer demo C', 'answer demo D']
        ],
        correctAnswer: [Answer.A, Answer.B, Answer.C]));
    demoResult.add(PartThreeModel(
        questions: [
          'Question demo part 3 - 7',
          'Question demo part 3 - 8',
          'Question demo part 3 - 9',
        ],
        questionNumber: [46, 47, 48],
        soundUrl: 'Sound URL part 3 demo - 3',
        answers: [
          ['answer demo A', 'answer demo B', 'answer demo C', 'answer demo D'],
          ['answer demo A', 'answer demo B', 'answer demo C', 'answer demo D'],
          ['answer demo A', 'answer demo B', 'answer demo C', 'answer demo D']
        ],
        correctAnswer: [Answer.A, Answer.B, Answer.C]));
    await Future.delayed(const Duration(milliseconds: 1000));
    return Future.value(demoResult);
  }
}
