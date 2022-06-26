import 'package:get_it/get_it.dart';

import '../../../business_models/execute_models/part_two_model.dart';
import '../../../data_providers/daos/part_execute_daos/part_two_dao.dart';
import 'part_two_repository.dart';

class PartTwoMobileRepositoryImpl implements PartTwoRepository {
  final _dao = GetIt.I.get<PartTwoDao>();

  @override
  Future<List<PartTwoModel>> getQuestionList(List<String> ids) async {
    return await _dao.queryAll(ids);
  }
}
