import '../../../business_models/execute_models/part_four_model.dart';
import '../../../data_providers/apis/part_execute_apis/part_four_api.dart';

abstract class PartFourRepository {
  Future<List<PartFourModel>> getQuestionList(List<String> ids);
}
