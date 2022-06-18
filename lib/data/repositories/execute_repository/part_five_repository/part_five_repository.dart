import '../../../business_models/execute_models/part_five_model.dart';

abstract class PartFiveRepository {
  Future<List<PartFiveModel>> getQuestionList(List<String> ids);
}
