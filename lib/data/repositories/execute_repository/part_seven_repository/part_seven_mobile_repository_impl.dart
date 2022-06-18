import '../../../business_models/execute_models/part_seven_model.dart';
import '../../../data_providers/daos/part_execute_daos/part_seven_dao.dart';
import '../../../di/injection.dart';
import 'part_seven_repository.dart';

class PartSevenMobileRepositoryImpl implements PartSevenRepository {
  final _dao = getIt.get<PartSevenDao>();

  @override
  Future<List<PartSevenModel>> getQuestionList(List<String> ids) {
    // TODO: implement getQuestionList
    throw UnimplementedError();
  }
}
