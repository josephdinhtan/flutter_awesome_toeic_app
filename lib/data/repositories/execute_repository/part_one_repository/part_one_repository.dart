import '../../../business_models/part_models/part_one_model.dart';
import '../../../data_providers/apis/part_execute_apis/part_one_api.dart';

abstract class PartOneRepository {
  Future<List<PartOneModel>> getQuestionList(List<String> ids);
}
