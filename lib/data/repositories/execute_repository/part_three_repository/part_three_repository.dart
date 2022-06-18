import '../../../business_models/execute_models/part_three_model.dart';

abstract class PartThreeRepository {
  Future<List<PartThreeModel>> getQuestionList(List<String> ids);
}
