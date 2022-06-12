import '../../../business_models/part_models/answer_enum.dart';
import '../../../business_models/part_models/part_five_model.dart';

class PartFiveApi {
  Future<List<PartFiveModel>> getQuestionList() async {
    final List<PartFiveModel> demoResult = [];
    await Future.delayed(const Duration(milliseconds: 1000));
    return Future.value(demoResult);
  }
}
