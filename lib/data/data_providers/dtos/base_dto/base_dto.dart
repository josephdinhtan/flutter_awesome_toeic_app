import 'package:flutter_toeic_quiz2/data/business_models/base_model/base_business_model.dart';

abstract class BaseDto<T extends BaseBusinessModel> {
  T toBusinessModel();
}
