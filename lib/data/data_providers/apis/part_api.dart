import '../../business_models/base_model/base_business_model.dart';
import '../../business_models/part_model.dart';
import '../dtos/part_dto.dart';
import 'base_api/base_api.dart';

class PartApi extends BaseApi<PartModel, PartDto> {
  @override
  Future<bool> addItem(PartDto item, String hiveId) {
    // TODO: implement addItem
    throw UnimplementedError();
  }

  @override
  Future<List<PartModel>> getAllItems(List<String> hiveIds) {
    // TODO: implement getAllItems
    throw UnimplementedError();
  }

  @override
  Future<PartModel?> getItem(String hiveId) {
    // TODO: implement getItem
    throw UnimplementedError();
  }

  @override
  Future<bool> removeItem(String hiveId) {
    // TODO: implement removeItem
    throw UnimplementedError();
  }

  @override
  Future<bool> updateItem(PartDto item) {
    // TODO: implement updateItem
    throw UnimplementedError();
  }
}
