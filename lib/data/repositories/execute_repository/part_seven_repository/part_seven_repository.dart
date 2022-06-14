import '../../../business_models/execute_models/part_seven_model.dart';
import '../../../data_providers/apis/part_execute_apis/part_seven_api.dart';

abstract class PartSevenRepository {
  late PartSevenApi api;
  Future<List<PartSevenModel>> getPartSevenQuestionList();
}
