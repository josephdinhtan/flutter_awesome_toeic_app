import 'package:get_it/get_it.dart';

import '../../../data_providers/daos/part_execute_daos/part_six_dao.dart';

import '../../../business_models/execute_models/part_six_model.dart';
import 'part_six_repository.dart';

class PartSixMobileRepositoryImpl implements PartSixRepository {
  final _dao = GetIt.I.get<PartSixDao>();

  @override
  Future<List<PartSixModel>> getQuestionList(List<String> ids) {
    // TODO: implement getQuestionList
    throw UnimplementedError();
  }
}