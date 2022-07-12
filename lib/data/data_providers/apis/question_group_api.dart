import 'package:flutter_toeic_quiz2/data/data_providers/dtos/question_group_dto.dart';

import '../../business_models/question_group_model.dart';
import 'base_api/base_api.dart';

class QuestionGroupApi
    implements BaseApi<QuestionGroupModel, QuestionGroupDto> {
  @override
  Future<bool> delete(String hiveId) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<bool> insert(QuestionGroupDto item, String hiveId) {
    // TODO: implement insert
    throw UnimplementedError();
  }

  @override
  Future<QuestionGroupModel?> query(String hiveId) {
    // TODO: implement query
    throw UnimplementedError();
  }

  @override
  Future<List<QuestionGroupModel>> queryAll(List<String> hiveIds) {
    // TODO: implement queryAll
    throw UnimplementedError();
  }

  @override
  Future<bool> update(QuestionGroupDto item) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
