import 'package:flutter_toeic_quiz2/data/data_providers/execute_api/part_four_api.dart';
import 'package:flutter_toeic_quiz2/data/models/part_models/part_four_model.dart';
import 'package:flutter_toeic_quiz2/data/repositories/execute_repository/part_four_repository/part_four_repository.dart';

class PartFourRepositoryImpl implements PartFourRepository {
  @override
  PartFourApi api;

  PartFourRepositoryImpl({required this.api});

  @override
  Future<List<PartFourModel>> getPartFourQuestionList() {
    return Future.value(api.getQuestionList());
  }
}
