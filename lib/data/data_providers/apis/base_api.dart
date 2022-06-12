import '../../base_api_dao/baseAPIDAO.dart';
import '../../business_models/base_model/base_business_model.dart';
import '../network_response_models/base_network_object/network_base_object.dart';

abstract class BaseApi<T extends BaseBusinessModel, N extends NetworkBaseObject>
    implements BaseAPIDAO<BaseBusinessModel, NetworkBaseObject> {}
