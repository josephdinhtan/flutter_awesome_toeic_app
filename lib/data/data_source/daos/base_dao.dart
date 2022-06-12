import 'package:hive/hive.dart';

import '../../base_api_dao/baseAPIDAO.dart';
import '../../business_models/base_model/base_business_model.dart';

abstract class BaseDAO<T, N>
    implements BaseAPIDAO<BaseBusinessModel, HiveObject> {}
