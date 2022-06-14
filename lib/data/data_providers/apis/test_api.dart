import 'package:flutter_toeic_quiz2/data/business_models/base_model/base_business_model.dart';

import '../../business_models/test_model.dart';
import '../dtos/test_dto.dart';
import 'base_api/base_api.dart';

class TestApi extends BaseApi<TestModel, TestDto> {
  @override
  Future<bool> addItem(TestDto item, String hiveId) {
    // TODO: implement addItem
    throw UnimplementedError();
  }

  @override
  Future<List<TestModel>> getAllItems(List<String> hiveIds) {
    // TODO: implement getAllItems
    throw UnimplementedError();
  }

  @override
  Future<TestModel?> getItem(String hiveId) {
    // TODO: implement getItem
    throw UnimplementedError();
  }

  @override
  Future<bool> removeItem(String hiveId) {
    // TODO: implement removeItem
    throw UnimplementedError();
  }

  @override
  Future<bool> updateItem(TestDto item) {
    // TODO: implement updateItem
    throw UnimplementedError();
  }
}
