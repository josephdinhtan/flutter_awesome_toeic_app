import 'package:flutter_toeic_quiz2/data/models/test_info_model.dart';

abstract class TestRepository {
  Future<List<TestInfoModel>> getTestList();
}
