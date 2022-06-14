import '../../../business_models/execute_models/part_one_model.dart';

abstract class PartOneRepository {
  Future<List<PartOneModel>> getQuestionList(List<String> ids);
}
