import 'package:get_it/get_it.dart';

import '../../../business_models/execute_models/part_five_model.dart';
import '../../../data_providers/apis/part_execute_apis/part_five_api.dart';
import 'part_five_repository.dart';

class PartFiveWebRepositoryImpl implements PartFiveRepository {
  final api = GetIt.I.get<PartFiveApi>();

  @override
  Future<List<PartFiveModel>> getQuestionList(List<String> ids) async {
    return await api.queryAll(ids);
  }
}
