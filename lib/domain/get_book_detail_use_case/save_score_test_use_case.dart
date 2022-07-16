import 'package:get_it/get_it.dart';

import '../../data/repositories/test_repository/test_repository.dart';
import '../base_use_case/BaseUseCase.dart';

class SaveScoreTestUseCase implements BaseUseCase<bool, List<dynamic>> {
  final repository = GetIt.I.get<TestRepository>();

  @override
  Future<bool> perform(testModelScore) async {
    return await repository.updateActualScoreToDB(
        testModelScore[0], testModelScore[1]);
  }
}
