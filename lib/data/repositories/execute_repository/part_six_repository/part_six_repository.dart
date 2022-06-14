import '../../../business_models/execute_models/part_six_model.dart';
import '../../../data_providers/apis/part_execute_apis/part_six_api.dart';

abstract class PartSixRepository {
  late PartSixApi api;
  Future<List<PartSixModel>> getPartSixQuestionList();
}
