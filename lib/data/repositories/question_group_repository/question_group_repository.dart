import '../../business_models/question_group_model.dart';

abstract class QuestionGroupRepository {
  Future<List<QuestionGroupModel>> getQuestionGroupList(List<String> ids);
  Future<bool> saveQuestionGroupList(
      List<QuestionGroupModel> questionGroupModelList);
}
