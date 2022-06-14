import '../../../business_models/execute_models/part_five_model.dart';

class PartFiveApi {
  Future<List<PartFiveModel>> getQuestionList() async {
    final List<PartFiveModel> demoResult = [];
    await Future.delayed(const Duration(milliseconds: 1000));
    return Future.value(demoResult);
  }
}
