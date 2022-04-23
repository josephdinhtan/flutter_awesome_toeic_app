import 'package:flutter_toeic_quiz2/data/data_providers/execute_api/part_six_api.dart';
import 'package:flutter_toeic_quiz2/data/models/part_models/part_six_model.dart';

abstract class PartSixRepository {
  late PartSixApi api;
  Future<List<PartSixModel>> getPartSixQuestionList();
}