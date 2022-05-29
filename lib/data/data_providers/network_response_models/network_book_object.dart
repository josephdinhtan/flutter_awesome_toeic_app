
import 'package:flutter_toeic_quiz2/data/business_models/book_info_model.dart';
import 'package:flutter_toeic_quiz2/data/data_providers/network_response_models/network_base_object.dart';


class NetworkBookObject implements NetworkBaseObject<BookInfoModel> {
  @override
  BookInfoModel toBusinessModel() {
    // TODO: implement toBusinessModel
    throw UnimplementedError();
  }

}
