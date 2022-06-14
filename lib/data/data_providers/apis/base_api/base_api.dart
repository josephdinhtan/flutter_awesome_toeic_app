import 'package:flutter_toeic_quiz2/data/data_providers/dtos/base_dto/base_dto.dart';

import '../../../business_models/base_model/base_business_model.dart';

abstract class BaseApi<T extends BaseBusinessModel, N extends BaseDto> {
  Future<T?> getItem(String hiveId);
  Future<List<T>> getAllItems(List<String> hiveIds);
  Future<bool> addItem(N item, String hiveId);
  Future<bool> removeItem(String hiveId);
  Future<bool> updateItem(N item);
}
