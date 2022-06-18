import '../../business_models/part_model.dart';
import '../dtos/part_dto.dart';
import 'base_api/base_api.dart';

class PartApi extends BaseApi<PartModel, PartDto> {
  @override
  Future<bool> insert(PartDto item, String hiveId) {
    // TODO: implement addItem
    throw UnimplementedError();
  }

  @override
  Future<List<PartModel>> queryAll(List<String> hiveIds) {
    // TODO: implement getAllItems
    throw UnimplementedError();
  }

  @override
  Future<PartModel?> query(String hiveId) {
    // TODO: implement getItem
    throw UnimplementedError();
  }

  @override
  Future<bool> delete(String hiveId) {
    // TODO: implement removeItem
    throw UnimplementedError();
  }

  @override
  Future<bool> update(PartDto item) {
    // TODO: implement updateItem
    throw UnimplementedError();
  }
}
