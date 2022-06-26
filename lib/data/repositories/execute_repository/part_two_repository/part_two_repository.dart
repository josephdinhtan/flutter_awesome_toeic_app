import '../../../business_models/execute_models/part_two_model.dart';

abstract class PartTwoRepository {
  Future<List<PartTwoModel>> getQuestionList(List<String> ids);
}
