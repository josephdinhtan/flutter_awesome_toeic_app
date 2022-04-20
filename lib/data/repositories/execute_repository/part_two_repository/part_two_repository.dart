import 'package:flutter_toeic_quiz2/data/data_providers/execute_api/part_two_api.dart';

import '../../../models/part_models/part_two_model.dart';

abstract class PartTwoRepository {
  late PartTwoApi api;
  Future<List<PartTwoModel>> getPartTwoQuestionList();
}
