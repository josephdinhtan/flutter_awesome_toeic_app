import '../../../business_models/execute_models/part_three_model.dart';
import '../../../data_providers/daos/part_execute_daos/part_three_dao.dart';
import '../../../di/injection.dart';
import 'part_three_repository.dart';

class PartThreeMobileRepositoryImpl implements PartThreeRepository {
  final _dao = getIt.get<PartThreeDao>();

  @override
  Future<List<PartThreeModel>> getQuestionList(List<String> ids) async {
    return await _dao.queryAll(ids);
  }
}
