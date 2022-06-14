import 'package:hive/hive.dart';

import '../../../business_models/base_model/base_business_model.dart';

abstract class BaseDao<T extends BaseBusinessModel, N extends HiveObject> {
  Future<T?> getItem(String hiveId);
  Future<List<T>> getAllItems(List<String> hiveIds);
  Future<bool> addItem(N item, String hiveId);
  Future<bool> removeItem(String hiveId);
  Future<bool> updateItem(N item);
}
