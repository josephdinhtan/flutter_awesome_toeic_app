import 'package:hive/hive.dart';

import '../business_models/base_model/base_model.dart';

abstract class BaseAPIDAO<T extends BaseBusinessModel, N> {
  Future<T?>getItem(String hiveId);
  Future<List<T>>getAllItems(List<String> hiveId);
  Future<bool>addItem(N item, String hiveId);
  Future<bool>removeItem(String hiveId);
  Future<bool>updateItem(N item);
}