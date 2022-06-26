import 'package:get_it/get_it.dart';

import '../../../business_models/execute_models/part_four_model.dart';
import '../../../data_providers/daos/part_execute_daos/part_four_dao.dart';
import 'part_four_repository.dart';

class PartFourMobileRepositoryImpl implements PartFourRepository {
  final _dao = GetIt.I.get<PartFourDao>();

  @override
  Future<List<PartFourModel>> getQuestionList(List<String> ids) async {
    return await _dao.queryAll(ids);
  }
}
