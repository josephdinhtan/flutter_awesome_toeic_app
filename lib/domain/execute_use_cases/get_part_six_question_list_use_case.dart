import 'package:get_it/get_it.dart';

import '../../data/repositories/execute_repository/part_six_repository/part_six_repository.dart';

import '../../data/business_models/execute_models/part_six_model.dart';

class GetPartSixQuestionListUseCase {
  final _repository = GetIt.I.get<PartSixRepository>();

  Future<List<PartSixModel>> getContent(List<String> ids) async {
    return await _repository.getQuestionList(ids);
  }
}
