
import 'package:flutter_toeic_quiz2/data/business_models/base_model/base_model.dart';

import 'package:flutter_toeic_quiz2/data/data_providers/network_response_models/network_base_object.dart';

import '../../../business_models/part_models/answer_enum.dart';
import '../../../business_models/part_models/part_five_model.dart';
import '../../network_response_models/network_part_object/network_part_five_object.dart';
import '../base_api.dart';

class PartFiveApi extends BaseApi<PartFiveModel, NetworkPartFiveObject> {
  @override
  Future<bool> addItem(NetworkBaseObject item, String hiveId) {
    // TODO: implement addItem
    throw UnimplementedError();
  }

  @override
  Future<List<BaseBusinessModel>> getAllItems() async {
    return await getFakeQuestionList();
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
  Future<bool> updateItem(NetworkBaseObject<BaseBusinessModel> item) {
    // TODO: implement updateItem
    throw UnimplementedError();
  }

  Future<List<PartFiveModel>> getFakeQuestionList() async {
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
