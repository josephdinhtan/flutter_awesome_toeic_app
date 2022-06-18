import '../base_api/base_api.dart';
import '../../dtos/parts_dto/part_five_dto.dart';

import '../../../business_models/execute_models/part_five_model.dart';

class PartFiveApi implements BaseApi<PartFiveModel, PartFiveDto> {
  @override
  Future<bool> delete(String hiveId) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<bool> insert(PartFiveDto item, String hiveId) {
    // TODO: implement insert
    throw UnimplementedError();
  }

  @override
  Future<PartFiveModel?> query(String hiveId) {
    // TODO: implement query
    throw UnimplementedError();
  }

  @override
  Future<List<PartFiveModel>> queryAll(List<String> hiveIds) {
    // TODO: implement queryAll
    throw UnimplementedError();
  }

  @override
  Future<bool> update(PartFiveDto item) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
