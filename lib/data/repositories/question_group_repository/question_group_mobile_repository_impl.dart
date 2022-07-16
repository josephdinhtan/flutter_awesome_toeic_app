import 'package:get_it/get_it.dart';

import '../../business_models/question_group_model.dart';
import '../../data_providers/daos/question_group_dao.dart';
import 'question_group_repository.dart';

const _logTag = "QuestionGroupMobileRepositoryImpl";

class QuestionGroupMobileRepositoryImpl implements QuestionGroupRepository {
  final _dao = GetIt.I.get<QuestionGroupDao>();

  @override
  Future<List<QuestionGroupModel>> getQuestionGroupList(
      List<String> ids) async {
    return await _dao.queryAll(ids);
  }

  @override
  Future<bool> saveQuestionGroupList(
      List<QuestionGroupModel> questionGroupModelList) async {
    for (final questionGroup in questionGroupModelList) {
      final ok =
          await _dao.insert(questionGroup.toHiveObject(), questionGroup.id);
      if (!ok) return Future.value(false);
    }
    return Future.value(true);
  }
}
