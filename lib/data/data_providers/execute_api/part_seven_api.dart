import '../../models/part_models/answer_enum.dart';
import '../../models/part_models/part_seven_model.dart';

class PartSevenApi {
  Future<List<PartSevenModel>> getQuestionList() async {
    final List<PartSevenModel> demoResult = [];

    demoResult.add(PartSevenModel(
        statement:
            'This is a demo statement for part 6, This is a demo statement for part 6, This is a demo statement for part 6, This is a demo statement for part 6, This is a demo statement for part 6, This is a demo statement for part 6, This is a demo statement for part 6, ',
        questions: [
          'Question demo part 3 - 1',
          'Question demo part 3 - 2',
          'Question demo part 3 - 3',
        ],
        questionNumber: [
          40,
          41,
          42
        ],
        answers: [
          ['answer demo A', 'answer demo B', 'answer demo C', 'answer demo D'],
          ['answer demo A', 'answer demo B', 'answer demo C', 'answer demo D'],
          ['answer demo A', 'answer demo B', 'answer demo C', 'answer demo D']
        ],
        correctAnswer: [
          Answer.A,
          Answer.B,
          Answer.C
        ]));
    demoResult.add(PartSevenModel(
        statement:
        'This is a demo statement for part 6, This is a demo statement for part 6, This is a demo statement for part 6, This is a demo statement for part 6, This is a demo statement for part 6, This is a demo statement for part 6, This is a demo statement for part 6, ',
        questions: [
          'Question demo part 3 - 4',
          'Question demo part 3 - 5',
          'Question demo part 3 - 6',
        ],
        questionNumber: [43, 44, 45],
        answers: [
          ['answer demo A', 'answer demo B', 'answer demo C', 'answer demo D'],
          ['answer demo A', 'answer demo B', 'answer demo C', 'answer demo D'],
          ['answer demo A', 'answer demo B', 'answer demo C', 'answer demo D']
        ],
        correctAnswer: [Answer.A, Answer.B, Answer.C]));
    demoResult.add(PartSevenModel(
        statement:
        'This is a demo statement for part 6, This is a demo statement for part 6, This is a demo statement for part 6, This is a demo statement for part 6, This is a demo statement for part 6, This is a demo statement for part 6, This is a demo statement for part 6, ',
        questions: [
          'Question demo part 3 - 7',
          'Question demo part 3 - 8',
          'Question demo part 3 - 9',
        ],
        questionNumber: [46, 47, 48],
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
