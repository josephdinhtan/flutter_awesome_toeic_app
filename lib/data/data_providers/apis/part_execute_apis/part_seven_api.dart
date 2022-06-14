import 'package:flutter_toeic_quiz2/data/business_models/base_model/base_business_model.dart';
import 'package:flutter_toeic_quiz2/data/data_providers/apis/base_api/base_api.dart';
import 'package:flutter_toeic_quiz2/data/data_providers/dtos/base_dto/base_dto.dart';

import '../../../business_models/execute_models/answer_enum.dart';
import '../../../business_models/execute_models/part_seven_model.dart';

class PartSevenApi implements BaseApi {
  @override
  Future<bool> addItem(BaseDto<BaseBusinessModel> item, String hiveId) {
    // TODO: implement addItem
    throw UnimplementedError();
  }

  @override
  Future<List<BaseBusinessModel>> getAllItems(List<String> hiveIds) {
    // TODO: implement getAllItems
    throw UnimplementedError();
  }

  @override
  Future<BaseBusinessModel?> getItem(String hiveId) {
    // TODO: implement getItem
    throw UnimplementedError();
  }

  @override
  Future<bool> removeItem(String hiveId) {
    // TODO: implement removeItem
    throw UnimplementedError();
  }

  @override
  Future<bool> updateItem(BaseDto<BaseBusinessModel> item) {
    // TODO: implement updateItem
    throw UnimplementedError();
  }

  Future<List<PartSevenModel>> getFakeQuestionList() async {
    final List<PartSevenModel> demoResult = [];

    demoResult.add(PartSevenModel(statement: [
      PartSevenStatement(
          style: PartSevenStatementTyle.TEXT,
          stringData:
              'This is a demo statement for part 6, This is a demo statement for part 6, This is a demo statement for part 6, This is a demo statement for part 6, This is a demo statement for part 6, This is a demo statement for part 6, This is a demo statement for part 6, ')
    ], questions: [
      'Question demo part 3 - 1',
      'Question demo part 3 - 2',
      'Question demo part 3 - 3',
    ], questionNumber: [
      40,
      41,
      42
    ], answers: [
      ['answer demo A', 'answer demo B', 'answer demo C', 'answer demo D'],
      ['answer demo A', 'answer demo B', 'answer demo C', 'answer demo D'],
      ['answer demo A', 'answer demo B', 'answer demo C', 'answer demo D']
    ], correctAnswer: [
      Answer.A,
      Answer.B,
      Answer.C
    ]));
    demoResult.add(PartSevenModel(statement: [
      PartSevenStatement(
          style: PartSevenStatementTyle.TEXT,
          stringData:
              'This is a demo statement for part 6, This is a demo statement for part 6, This is a demo statement for part 6, This is a demo statement for part 6, This is a demo statement for part 6, This is a demo statement for part 6, This is a demo statement for part 6, ')
    ], questions: [
      'Question demo part 3 - 4',
      'Question demo part 3 - 5',
      'Question demo part 3 - 6',
    ], questionNumber: [
      43,
      44,
      45
    ], answers: [
      ['answer demo A', 'answer demo B', 'answer demo C', 'answer demo D'],
      ['answer demo A', 'answer demo B', 'answer demo C', 'answer demo D'],
      ['answer demo A', 'answer demo B', 'answer demo C', 'answer demo D']
    ], correctAnswer: [
      Answer.A,
      Answer.B,
      Answer.C
    ]));
    demoResult.add(PartSevenModel(statement: [
      PartSevenStatement(
          style: PartSevenStatementTyle.TEXT,
          stringData:
              'This is a demo statement for part 6, This is a demo statement for part 6, This is a demo statement for part 6, This is a demo statement for part 6, This is a demo statement for part 6, This is a demo statement for part 6, This is a demo statement for part 6, ')
    ], questions: [
      'Question demo part 3 - 7',
      'Question demo part 3 - 8',
      'Question demo part 3 - 9',
    ], questionNumber: [
      46,
      47,
      48
    ], answers: [
      ['answer demo A', 'answer demo B', 'answer demo C', 'answer demo D'],
      ['answer demo A', 'answer demo B', 'answer demo C', 'answer demo D'],
      ['answer demo A', 'answer demo B', 'answer demo C', 'answer demo D']
    ], correctAnswer: [
      Answer.A,
      Answer.B,
      Answer.C
    ]));
    await Future.delayed(const Duration(milliseconds: 1000));
    return Future.value(demoResult);
  }
}
