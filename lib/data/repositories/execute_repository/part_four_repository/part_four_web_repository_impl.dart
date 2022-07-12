import 'package:get_it/get_it.dart';

import '../../../business_models/execute_models/part_four_model.dart';
import '../../../data_providers/apis/part_execute_apis/part_four_api.dart';
import 'part_four_repository.dart';

class PartFourWebRepositoryImpl implements PartFourRepository {
  final _api = GetIt.I.get<PartFourApi>();

  @override
  Future<List<PartFourModel>> getQuestionList(List<String> ids) async {
    return await _api.queryAll(ids);
  }
}
