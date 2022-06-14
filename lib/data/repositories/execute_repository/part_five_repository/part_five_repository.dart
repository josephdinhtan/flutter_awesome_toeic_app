import '../../../business_models/execute_models/part_five_model.dart';
import '../../../data_providers/apis/part_execute_apis/part_five_api.dart';

abstract class PartFiveRepository {
  Future<List<PartFiveModel>> getPartFiveQuestionList();
}
