import '../base_api/base_api.dart';
import '../../dtos/parts_dto/part_two_dto.dart';

import '../../../business_models/execute_models/part_two_model.dart';

class PartTwoApi implements BaseApi<PartTwoModel, PartTwoDto> {
  @override
  Future<bool> delete(String hiveId) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<bool> insert(PartTwoDto item, String hiveId) {
    // TODO: implement insert
    throw UnimplementedError();
  }

  @override
  Future<PartTwoModel?> query(String hiveId) {
    // TODO: implement query
    throw UnimplementedError();
  }

  @override
  Future<List<PartTwoModel>> queryAll(List<String> hiveIds) {
    // TODO: implement queryAll
    throw UnimplementedError();
  }

  @override
  Future<bool> update(PartTwoDto item) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
