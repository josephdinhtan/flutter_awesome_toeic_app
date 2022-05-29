
import '../../../business_models/part_models/part_three_model.dart';
import '../../../data_providers/apis/part_execute_apis/part_three_api.dart';
import 'part_three_repository.dart';

class PartThreeRepositoryImpl implements PartThreeRepository {
  @override
  PartThreeApi api;

  PartThreeRepositoryImpl({required this.api});

  @override
  Future<List<PartThreeModel>> getPartThreeQuestionList() {
    return Future.value(api.getQuestionList());
  }
}
