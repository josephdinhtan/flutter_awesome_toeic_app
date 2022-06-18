import '../../../business_models/execute_models/part_five_model.dart';
import '../../hive_objects/part_execute_hive_object/part_five_hive_object.dart';
import '../base_dao/base_dao.dart';

const _logTag = "PartFiveDAO";

class PartFiveDao implements BaseDao<PartFiveModel, PartFiveHiveObject> {
  @override
  Future<bool> insert(PartFiveHiveObject item, String hiveId) {
    // TODO: implement addItem
    throw UnimplementedError();
  }

  @override
  Future<List<PartFiveModel>> queryAll(List<String> hiveIds) {
    // TODO: implement getAllItems
    throw UnimplementedError();
  }

  @override
  Future<PartFiveModel?> query(String hiveId) {
    // TODO: implement getItem
    throw UnimplementedError();
  }

  @override
  Future<bool> delete(String hiveId) {
    // TODO: implement removeItem
    throw UnimplementedError();
  }

  @override
  Future<bool> update(PartFiveHiveObject item) {
    // TODO: implement updateItem
    throw UnimplementedError();
  }
}
