import '../../../business_models/execute_models/part_three_model.dart';
import '../../dtos/parts_dto/part_three_dto.dart';
import '../base_api/base_api.dart';

class PartThreeApi implements BaseApi<PartThreeModel, PartThreeDto> {
  @override
  Future<bool> delete(String hiveId) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<bool> insert(PartThreeDto item, String hiveId) {
    // TODO: implement insert
    throw UnimplementedError();
  }

  @override
  Future<PartThreeModel?> query(String hiveId) {
    // TODO: implement query
    throw UnimplementedError();
  }

  @override
  Future<List<PartThreeModel>> queryAll(List<String> hiveIds) {
    // TODO: implement queryAll
    throw UnimplementedError();
  }

  @override
  Future<bool> update(PartThreeDto item) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
