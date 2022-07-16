import 'package:get_it/get_it.dart';

import '../../data/business_models/question_group_model.dart';
import '../../data/repositories/question_group_repository/question_group_repository.dart';
import '../base_use_case/BaseUseCase.dart';

class SaveQuestionGroupListUseCase
    implements BaseUseCase<bool, List<QuestionGroupModel>> {
  final repository = GetIt.I.get<QuestionGroupRepository>();

  @override
  Future<bool> perform(questionGroupModelList) async {
    return await repository.saveQuestionGroupList(questionGroupModelList);
  }
}
