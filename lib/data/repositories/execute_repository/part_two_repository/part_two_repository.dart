
import '../../../business_models/part_models/part_two_model.dart';
import '../../../data_providers/apis/part_execute_apis/part_two_api.dart';

abstract class PartTwoRepository {
  late PartTwoApi api;
  Future<List<PartTwoModel>> getPartTwoQuestionList();
}
