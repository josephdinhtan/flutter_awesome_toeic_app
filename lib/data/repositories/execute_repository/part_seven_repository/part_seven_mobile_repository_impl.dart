import 'package:get_it/get_it.dart';

import '../../../business_models/execute_models/part_seven_model.dart';
import '../../../data_providers/daos/part_execute_daos/part_seven_dao.dart';
import 'part_seven_repository.dart';

class PartSevenMobileRepositoryImpl implements PartSevenRepository {
  final _dao = GetIt.I.get<PartSevenDao>();

  @override
  Future<List<PartSevenModel>> getQuestionList(List<String> ids) {
    // TODO: implement getQuestionList
    throw UnimplementedError();
  }
}
