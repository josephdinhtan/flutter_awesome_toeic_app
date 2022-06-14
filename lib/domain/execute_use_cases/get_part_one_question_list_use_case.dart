import 'package:flutter_toeic_quiz2/domain/base_use_case/BaseUseCase.dart';

import '../../data/business_models/execute_models/part_one_model.dart';
import '../../data/repositories/execute_repository/part_one_repository/part_one_repository.dart';
import '../../data/repositories/execute_repository/part_one_repository/part_one_mobile_repository_impl.dart';

class GetPartOneQuestionListUseCase
    implements BaseUseCase<List<PartOneModel>, List<String>> {
  static final GetPartOneQuestionListUseCase _singleton =
      GetPartOneQuestionListUseCase._internal();
  GetPartOneQuestionListUseCase._internal();
  factory GetPartOneQuestionListUseCase() => _singleton;

  // need Dependency injection here refer to di folder in data
  //PartOneRepository repository = getRepocitory();
  PartOneRepository repository = PartOneMobileRepositoryImpl();

  @override
  Future<List<PartOneModel>> perform(ids) async {
    return await repository.getQuestionList(ids);
  }
}
