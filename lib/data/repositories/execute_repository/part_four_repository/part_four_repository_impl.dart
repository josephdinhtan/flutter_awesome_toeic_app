import 'package:flutter_toeic_quiz2/data/repositories/execute_repository/part_four_repository/part_four_repository.dart';
import '../../../business_models/part_models/part_four_model.dart';
import '../../../data_providers/apis/part_execute_apis/part_four_api.dart';


class PartFourRepositoryImpl implements PartFourRepository {
  @override
  PartFourApi api;

  PartFourRepositoryImpl({required this.api});

  @override
  Future<List<PartFourModel>> getPartFourQuestionList() {
    return Future.value(api.getQuestionList());
  }
}
