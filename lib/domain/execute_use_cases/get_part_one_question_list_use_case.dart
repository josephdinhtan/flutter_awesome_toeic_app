import 'package:get_it/get_it.dart';

import '../base_use_case/BaseUseCase.dart';

import '../../data/business_models/execute_models/part_one_model.dart';
import '../../data/repositories/execute_repository/part_one_repository/part_one_repository.dart';

class GetPartOneQuestionListUseCase
    implements BaseUseCase<List<PartOneModel>, List<String>> {
  PartOneRepository repository = GetIt.I.get<PartOneRepository>();

  @override
  Future<List<PartOneModel>> perform(ids) async {
    return await repository.getQuestionList(ids);
  }
}
