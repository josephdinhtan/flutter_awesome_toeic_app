import 'package:flutter_toeic_quiz2/data/dataproviders/base_api.dart';
import 'package:flutter_toeic_quiz2/data/models/book_info_model.dart';

class BookApi extends BaseApi<List<BookInfoModel>> {
  @override
  Future<List<BookInfoModel>> get() async {
    // TODO: implement get from remote with http request and should be repose a Reponse folder
    List<BookInfoModel> list = [];
    list.add(BookInfoModel(
        id: 1,
        title: "Book 1 ets 2020",
        des: "10 test latest 2020",
        author: "awesome english team",
        coverUrl: "demo cover url",
        price: 1200));
    list.add(BookInfoModel(
        id: 2,
        title: "Book 1 ets 2021",
        des: "10 test latest 2021",
        author: "awesome english team",
        coverUrl: "demo cover url",
        price: 1200));
    list.add(BookInfoModel(
        id: 2,
        title: "Book 1 ets 2022",
        des: "10 test latest 2022",
        author: "awesome english team",
        coverUrl: "demo cover url",
        price: 1200));

    await Future.delayed(const Duration(milliseconds: 1000));
    return Future.value(list);
  }
}
