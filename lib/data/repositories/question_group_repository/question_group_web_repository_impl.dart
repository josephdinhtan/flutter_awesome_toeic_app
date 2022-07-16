import 'package:get_it/get_it.dart';

import '../../business_models/question_group_model.dart';
import '../../data_providers/apis/question_group_api.dart';
import 'question_group_repository.dart';

class QuestionGroupWebRepositoryImpl implements QuestionGroupRepository {
  final _api = GetIt.I.get<QuestionGroupApi>();

  @override
  Future<List<QuestionGroupModel>> getQuestionGroupList(
      List<String> ids) async {
    return await _api.queryAll(ids);
  }

  @override
  Future<bool> saveQuestionGroupList(
      List<QuestionGroupModel> questionGroupModelList) {
    // TODO: implement saveQuestionGroupList
    throw UnimplementedError();
  }
}
