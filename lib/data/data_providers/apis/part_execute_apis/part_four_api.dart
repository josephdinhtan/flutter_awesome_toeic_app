import '../../../business_models/base_model/base_business_model.dart';
import '../base_api/base_api.dart';
import '../../dtos/base_dto/base_dto.dart';
import '../../dtos/parts_dto/part_four_dto.dart';

import '../../../business_models/execute_models/answer_enum.dart';
import '../../../business_models/execute_models/part_four_model.dart';

class PartFourApi implements BaseApi<PartFourModel, PartFourDto> {
  @override
  Future<bool> delete(String hiveId) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<bool> insert(PartFourDto item, String hiveId) {
    // TODO: implement insert
    throw UnimplementedError();
  }

  @override
  Future<PartFourModel?> query(String hiveId) {
    // TODO: implement query
    throw UnimplementedError();
  }

  @override
  Future<List<PartFourModel>> queryAll(List<String> hiveIds) {
    // TODO: implement queryAll
    throw UnimplementedError();
  }

  @override
  Future<bool> update(PartFourDto item) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
