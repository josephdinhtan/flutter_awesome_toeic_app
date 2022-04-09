import 'package:flutter_toeic_quiz2/data/dataproviders/base_api.dart';
import 'package:flutter_toeic_quiz2/data/models/book_infor.dart';

class BookApi extends BaseApi<List<BookInfor>> {
  @override
  Future<List<BookInfor>> get() async {
    // TODO: implement get from remote with http request and should be repose a Reponse folder
    List<BookInfor> list = [];
    list.add(BookInfor(
        id: 1,
        title: "demo title",
        des: "demo des",
        author: "demo author",
        coverUrl: "demo cover url",
        price: 1200));
    list.add(BookInfor(
        id: 2,
        title: "demo title 2",
        des: "demo des 2",
        author: "demo author 2",
        coverUrl: "demo cover url 2",
        price: 1200));

    await Future.delayed(const Duration(milliseconds: 1000));
    return Future.value(list);
  }
}
