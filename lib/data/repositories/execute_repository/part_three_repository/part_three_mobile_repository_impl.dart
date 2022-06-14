import '../../../business_models/execute_models/part_three_model.dart';
import '../../../data_providers/daos/base_dao/base_dao.dart';
import '../../../data_providers/daos/part_execute_daos/part_three_dao.dart';
import 'part_three_repository.dart';

class PartThreeMobileRepositoryImpl implements PartThreeRepository {
  final BaseDao _dao = PartThreeDao();

  @override
  Future<List<PartThreeModel>> getQuestionList(List<String> ids) async {
    return await _dao.getAllItems(ids) as List<PartThreeModel>;
  }
}
