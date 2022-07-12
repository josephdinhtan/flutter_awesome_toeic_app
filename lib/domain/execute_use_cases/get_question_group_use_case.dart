import 'package:get_it/get_it.dart';

import '../../data/business_models/question_group_model.dart';
import '../../data/repositories/question_group_repository/question_group_repository.dart';
import '../base_use_case/BaseUseCase.dart';

class GetQuestionGroupListUseCase
    implements BaseUseCase<List<QuestionGroupModel>, List<String>> {
  final repository = GetIt.I.get<QuestionGroupRepository>();

  @override
  Future<List<QuestionGroupModel>> perform(ids) async {
    return await repository.getQuestionGroupList(ids);
  }
}
