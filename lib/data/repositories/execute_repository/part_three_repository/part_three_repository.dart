import 'package:flutter_toeic_quiz2/data/data_providers/execute_api/part_three_api.dart';
import 'package:flutter_toeic_quiz2/data/models/part_models/part_three_model.dart';

abstract class PartThreeRepository {
  late PartThreeApi api;
  Future<List<PartThreeModel>> getPartThreeQuestionList();
}