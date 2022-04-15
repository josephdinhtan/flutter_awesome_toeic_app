
import 'package:flutter_toeic_quiz2/data/dataproviders/execute_api/part_one_api.dart';

import '../../../models/part_models/part_one_model.dart';

abstract class PartOneRepository {
  late PartOneApi api;
  Future<PartOneModel> getPartOneQuestionContent();
}