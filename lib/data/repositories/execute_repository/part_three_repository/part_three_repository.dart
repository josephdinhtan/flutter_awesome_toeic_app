
import '../../../business_models/part_models/part_three_model.dart';
import '../../../data_providers/apis/part_execute_apis/part_three_api.dart';

abstract class PartThreeRepository {
  late PartThreeApi api;
  Future<List<PartThreeModel>> getPartThreeQuestionList();
}