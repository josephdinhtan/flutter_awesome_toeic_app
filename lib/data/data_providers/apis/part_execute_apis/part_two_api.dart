import 'package:flutter_toeic_quiz2/data/business_models/base_model/base_business_model.dart';
import 'package:flutter_toeic_quiz2/data/data_providers/apis/base_api/base_api.dart';
import 'package:flutter_toeic_quiz2/data/data_providers/dtos/base_dto/base_dto.dart';

import '../../../business_models/execute_models/answer_enum.dart';
import '../../../business_models/execute_models/part_two_model.dart';

class PartTwoApi implements BaseApi {
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

  Future<List<PartTwoModel>> getQuestionList() async {
    final List<PartTwoModel> demoResult = [];

    demoResult.add(PartTwoModel(
      questionNumber: 1,
      soundUrl: 'this is a sound url 1',
      answers: ['A. Ans A', 'B. Ans B', 'C. Ans C', 'D. Ans D'],
      correctAnswer: Answer.A,
    ));
    demoResult.add(PartTwoModel(
      questionNumber: 2,
      soundUrl: 'this is a sound url 2',
      answers: ['A. Ans A', 'B. Ans B', 'C. Ans C', 'D. Ans D'],
      correctAnswer: Answer.A,
    ));
    demoResult.add(PartTwoModel(
      questionNumber: 3,
      soundUrl: 'this is a sound url 3',
      answers: ['A. Ans A', 'B. Ans B', 'C. Ans C', 'D. Ans D'],
      correctAnswer: Answer.A,
    ));
    demoResult.add(PartTwoModel(
      questionNumber: 4,
      soundUrl: 'this is a sound url 4',
      answers: ['A. Ans A', 'B. Ans B', 'C. Ans C', 'D. Ans D'],
      correctAnswer: Answer.A,
    ));
    demoResult.add(PartTwoModel(
      questionNumber: 5,
      soundUrl: 'this is a sound url 5',
      answers: ['A. Ans A', 'B. Ans B', 'C. Ans C', 'D. Ans D'],
      correctAnswer: Answer.A,
    ));
    demoResult.add(PartTwoModel(
      questionNumber: 6,
      soundUrl: 'this is a sound url 6',
      answers: ['A. Ans A', 'B. Ans B', 'C. Ans C', 'D. Ans D'],
      correctAnswer: Answer.A,
    ));
    await Future.delayed(const Duration(milliseconds: 1000));
    return Future.value(demoResult);
  }
}
