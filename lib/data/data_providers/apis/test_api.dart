import '../../business_models/test_model.dart';
import '../dtos/test_dto.dart';
import 'base_api/base_api.dart';

class TestApi extends BaseApi<TestModel, TestDto> {
  @override
  Future<bool> insert(TestDto item, String hiveId) {
    // TODO: implement addItem
    throw UnimplementedError();
  }

  @override
  Future<List<TestModel>> queryAll(List<String> hiveIds) {
    // TODO: implement getAllItems
    throw UnimplementedError();
  }

  @override
  Future<TestModel?> query(String hiveId) {
    // TODO: implement getItem
    throw UnimplementedError();
  }

  @override
  Future<bool> delete(String hiveId) {
    // TODO: implement removeItem
    throw UnimplementedError();
  }

  @override
  Future<bool> update(TestDto item) {
    // TODO: implement updateItem
    throw UnimplementedError();
  }
}
