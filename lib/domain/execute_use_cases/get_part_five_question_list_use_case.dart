import 'package:flutter_toeic_quiz2/data/data_providers/apis/part_execute_apis/part_five_api.dart';
import 'package:flutter_toeic_quiz2/data/repositories/execute_repository/part_five_repository/part_five_repository_impl.dart';
import 'package:flutter_toeic_quiz2/domain/base_use_case/BaseUseCase.dart';

import '../../data/business_models/execute_models/part_five_model.dart';
import '../../data/repositories/execute_repository/part_five_repository/part_five_repository.dart';

class GetPartFiveQuestionListUseCase
    implements BaseUseCase<List<PartFiveModel>, void> {
  PartFiveRepository repository = PartFiveRepositoryImpl(api: PartFiveApi());

  GetPartFiveQuestionListUseCase();

  @override
  Future<List<PartFiveModel>> perform(_) {
    // it may include boxId here
    return Future.value(repository.getPartFiveQuestionList());
  }
}
