import '../../../business_models/execute_models/part_two_model.dart';
import '../../../data_providers/apis/part_execute_apis/part_two_api.dart';

abstract class PartTwoRepository {
  Future<List<PartTwoModel>> getQuestionList(List<String> ids);
}
