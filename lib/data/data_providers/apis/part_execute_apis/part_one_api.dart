import '../../../business_models/execute_models/part_one_model.dart';
import '../../dtos/parts_dto/part_one_dto.dart';
import '../base_api/base_api.dart';

class PartOneApi implements BaseApi<PartOneModel, PartOneDto> {
  @override
  Future<bool> insert(PartOneDto item, String hiveId) {
    // TODO: implement addItem
    throw UnimplementedError();
  }

  @override
  Future<List<PartOneModel>> queryAll(List<String> hiveIds) {
    // TODO: implement getAllItems
    throw UnimplementedError();
  }

  @override
  Future<PartOneModel?> query(String hiveId) {
    // TODO: implement getItem
    throw UnimplementedError();
  }

  @override
  Future<bool> delete(String hiveId) {
    // TODO: implement removeItem
    throw UnimplementedError();
  }

  @override
  Future<bool> update(PartOneDto item) {
    // TODO: implement updateItem
    throw UnimplementedError();
  }
}
