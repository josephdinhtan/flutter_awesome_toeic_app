import 'package:flutter_toeic_quiz2/domain/base_use_case/BaseUseCase.dart';

import '../../data/business_models/part_models/part_one_model.dart';
import '../../data/repositories/execute_repository/part_one_repository/part_one_repository.dart';
import '../../data/repositories/execute_repository/part_one_repository/part_one_repository_impl.dart';

class GetPartOneQuestionListUseCase
    implements BaseUseCase<List<PartOneModel>, List<String>> {
  static final GetPartOneQuestionListUseCase _singleton =
      GetPartOneQuestionListUseCase._internal();
  GetPartOneQuestionListUseCase._internal();
  factory GetPartOneQuestionListUseCase() => _singleton;

  PartOneRepository repository = PartOneRepositoryImpl();

  @override
  Future<List<PartOneModel>> perform(ids) {
    // it may include boxId here
    return Future.value(repository.getQuestionList(ids));
  }
}
