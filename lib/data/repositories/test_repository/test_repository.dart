
import '../../business_models/test_info_model.dart';

abstract class TestRepository {
  Future<List<TestInfoModel>> getTestList();
}
