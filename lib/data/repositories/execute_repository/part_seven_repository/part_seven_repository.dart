import '../../../business_models/execute_models/part_seven_model.dart';

abstract class PartSevenRepository {
  Future<List<PartSevenModel>> getQuestionList(List<String> ids);
}
