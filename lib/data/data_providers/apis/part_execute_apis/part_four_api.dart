import 'package:flutter_toeic_quiz2/data/data_providers/apis/base_api/base_api.dart';
import 'package:flutter_toeic_quiz2/data/data_providers/dtos/parts_dto/part_four_dto.dart';

import '../../../business_models/execute_models/answer_enum.dart';
import '../../../business_models/execute_models/part_four_model.dart';

class PartFourApi implements BaseApi<PartFourModel, PartFourDto> {
  @override
  Future<bool> addItem(PartFourDto item, String hiveId) {
    // TODO: implement addItem
    throw UnimplementedError();
  }

  @override
  Future<List<PartFourModel>> getAllItems(List<String> hiveIds) {
    // TODO: implement getAllItems
    throw UnimplementedError();
  }

  @override
  Future<PartFourModel?> getItem(String hiveId) {
    // TODO: implement getItem
    throw UnimplementedError();
  }

  @override
  Future<bool> removeItem(String hiveId) {
    // TODO: implement removeItem
    throw UnimplementedError();
  }

  @override
  Future<bool> updateItem(PartFourDto item) {
    // TODO: implement updateItem
    throw UnimplementedError();
  }

  Future<List<PartFourModel>> getFakeQuestionList() async {
    final List<PartFourModel> demoResult = [];

    demoResult.add(PartFourModel(
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
    demoResult.add(PartFourModel(
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
    demoResult.add(PartFourModel(
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
