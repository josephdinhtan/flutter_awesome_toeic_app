import '../../../business_models/execute_models/part_two_model.dart';
import '../../../data_providers/apis/part_execute_apis/part_two_api.dart';
import '../../../di/injection.dart';
import 'part_two_repository.dart';

class PartTwoWebRepositoryImpl implements PartTwoRepository {
  final _api = getIt.get<PartTwoApi>();

  @override
  Future<List<PartTwoModel>> getQuestionList(List<String> ids) async {
    return await _api.queryAll(ids);
  }
}
