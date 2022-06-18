import '../../../business_models/execute_models/part_three_model.dart';
import '../../../data_providers/apis/part_execute_apis/part_three_api.dart';
import '../../../di/injection.dart';
import 'part_three_repository.dart';

class PartThreeWebRepositoryImpl implements PartThreeRepository {
  final _api = getIt.get<PartThreeApi>();

  @override
  Future<List<PartThreeModel>> getQuestionList(List<String> ids) async {
    return await _api.queryAll(ids);
  }
}
