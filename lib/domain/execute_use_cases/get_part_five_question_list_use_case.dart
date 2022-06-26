import 'package:get_it/get_it.dart';

import '../../data/business_models/execute_models/part_five_model.dart';
import '../../data/repositories/execute_repository/part_five_repository/part_five_repository.dart';
import '../base_use_case/BaseUseCase.dart';

class GetPartFiveQuestionListUseCase
    implements BaseUseCase<List<PartFiveModel>, List<String>> {
  final _repository = GetIt.I.get<PartFiveRepository>();

  @override
  Future<List<PartFiveModel>> perform(ids) {
    // it may include boxId here
    return Future.value(_repository.getQuestionList(ids));
  }
}
