import '../../../business_models/execute_models/part_six_model.dart';
import '../../../data_providers/apis/part_execute_apis/part_six_api.dart';

abstract class PartSixRepository {
  Future<List<PartSixModel>> getQuestionList(List<String> ids);
}
