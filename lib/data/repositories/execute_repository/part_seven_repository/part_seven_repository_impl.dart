import 'package:flutter_toeic_quiz2/data/data_providers/execute_api/part_seven_api.dart';
import 'package:flutter_toeic_quiz2/data/models/part_models/part_seven_model.dart';
import 'package:flutter_toeic_quiz2/data/repositories/execute_repository/part_seven_repository/part_seven_repository.dart';

class PartSevenRepositoryImpl implements PartSevenRepository {
  @override
  PartSevenApi api;

  PartSevenRepositoryImpl({required this.api});

  @override
  Future<List<PartSevenModel>> getPartSevenQuestionList() {
    return Future.value(api.getQuestionList());
  }
}
