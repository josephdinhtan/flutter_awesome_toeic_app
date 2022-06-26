import 'package:get_it/get_it.dart';

import '../../../business_models/execute_models/part_six_model.dart';
import '../../../data_providers/apis/part_execute_apis/part_six_api.dart';
import 'part_six_repository.dart';

class PartSixWebRepositoryImpl implements PartSixRepository {
  final _api = GetIt.I.get<PartSixApi>();

  @override
  Future<List<PartSixModel>> getQuestionList(List<String> ids) {
    // TODO: implement getQuestionList
    throw UnimplementedError();
  }
}
