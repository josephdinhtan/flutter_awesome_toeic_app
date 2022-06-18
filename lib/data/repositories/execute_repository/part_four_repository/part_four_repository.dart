import '../../../business_models/execute_models/part_four_model.dart';

abstract class PartFourRepository {
  Future<List<PartFourModel>> getQuestionList(List<String> ids);
}
