import 'package:flutter_toeic_quiz2/data/data_providers/execute_api/part_five_api.dart';
import 'package:flutter_toeic_quiz2/data/models/part_models/part_five_model.dart';

abstract class PartFiveRepository {
  late PartFiveApi api;
  Future<List<PartFiveModel>> getPartFiveQuestionList();
}