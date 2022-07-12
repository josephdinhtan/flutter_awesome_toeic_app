import 'package:get_it/get_it.dart';

import '../../business_models/question_group_model.dart';
import '../../data_providers/daos/question_group_dao.dart';
import 'question_group_repository.dart';

class QuestionGroupMobileRepositoryImpl implements QuestionGroupRepository {
  final _dao = GetIt.I.get<QuestionGroupDao>();

  @override
  Future<List<QuestionGroupModel>> getQuestionGroupList(
      List<String> ids) async {
    return await _dao.queryAll(ids);
  }
}
