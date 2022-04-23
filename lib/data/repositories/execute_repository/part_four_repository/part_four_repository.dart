import 'package:flutter_toeic_quiz2/data/data_providers/execute_api/part_four_api.dart';
import 'package:flutter_toeic_quiz2/data/models/part_models/part_four_model.dart';

abstract class PartFourRepository {
  late PartFourApi api;
  Future<List<PartFourModel>> getPartFourQuestionList();
}