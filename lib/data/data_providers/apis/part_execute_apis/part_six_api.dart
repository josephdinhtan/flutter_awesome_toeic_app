import '../../../business_models/execute_models/part_six_model.dart';
import '../../dtos/parts_dto/part_six_dto.dart';
import '../base_api/base_api.dart';

class PartSixApi implements BaseApi<PartSixModel, PartSixDto> {
  @override
  Future<bool> delete(String hiveId) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<bool> insert(PartSixDto item, String hiveId) {
    // TODO: implement insert
    throw UnimplementedError();
  }

  @override
  Future<PartSixModel?> query(String hiveId) {
    // TODO: implement query
    throw UnimplementedError();
  }

  @override
  Future<List<PartSixModel>> queryAll(List<String> hiveIds) {
    // TODO: implement queryAll
    throw UnimplementedError();
  }

  @override
  Future<bool> update(PartSixDto item) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
