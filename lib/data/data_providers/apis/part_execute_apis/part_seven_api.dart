import '../base_api/base_api.dart';
import '../../dtos/parts_dto/part_seven_dto.dart';
import '../../../business_models/execute_models/part_seven_model.dart';

class PartSevenApi implements BaseApi<PartSevenModel, PartSevenDto> {
  @override
  Future<bool> delete(String hiveId) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<bool> insert(PartSevenDto item, String hiveId) {
    // TODO: implement insert
    throw UnimplementedError();
  }

  @override
  Future<PartSevenModel?> query(String hiveId) {
    // TODO: implement query
    throw UnimplementedError();
  }

  @override
  Future<List<PartSevenModel>> queryAll(List<String> hiveIds) {
    // TODO: implement queryAll
    throw UnimplementedError();
  }

  @override
  Future<bool> update(PartSevenDto item) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
