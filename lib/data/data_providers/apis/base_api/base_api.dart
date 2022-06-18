import '../../dtos/base_dto/base_dto.dart';

import '../../../business_models/base_model/base_business_model.dart';

abstract class BaseApi<T extends BaseBusinessModel, N extends BaseDto> {
  Future<T?> query(String hiveId);
  Future<List<T>> queryAll(List<String> hiveIds);
  Future<bool> insert(N item, String hiveId);
  Future<bool> delete(String hiveId);
  Future<bool> update(N item);
}
