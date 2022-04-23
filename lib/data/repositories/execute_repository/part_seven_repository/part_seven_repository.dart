import 'package:flutter_toeic_quiz2/data/data_providers/execute_api/part_seven_api.dart';
import 'package:flutter_toeic_quiz2/data/models/part_models/part_seven_model.dart';

abstract class PartSevenRepository {
  late PartSevenApi api;
  Future<List<PartSevenModel>> getPartSevenQuestionList();
}