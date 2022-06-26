import 'package:get_it/get_it.dart';

import '../../../data_providers/apis/part_execute_apis/part_one_api.dart';
import 'part_one_repository.dart';

import '../../../business_models/execute_models/part_one_model.dart';

class PartOneWebRepositoryImpl implements PartOneRepository {
  final _api = GetIt.I.get<PartOneApi>();

  @override
  Future<List<PartOneModel>> getQuestionList(List<String> ids) async {
    return await _api.queryAll(ids);
  }
}
