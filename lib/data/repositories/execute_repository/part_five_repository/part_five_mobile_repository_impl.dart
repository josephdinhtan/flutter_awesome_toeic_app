import '../../../business_models/execute_models/part_five_model.dart';
import '../../../data_providers/daos/base_dao/base_dao.dart';
import '../../../data_providers/daos/part_execute_daos/part_five_dao.dart';
import '../../../di/injection.dart';
import 'part_five_repository.dart';

class PartFiveMobileRepositoryImpl implements PartFiveRepository {
  final BaseDao _dao = getIt.get<PartFiveDao>();

  @override
  Future<List<PartFiveModel>> getQuestionList(List<String> ids) async {
    return await _dao.queryAll(ids) as List<PartFiveModel>;
  }
}
