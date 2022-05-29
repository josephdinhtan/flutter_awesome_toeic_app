import 'package:flutter_toeic_quiz2/data/data_source/hive_objects/book_hive_object/book_hive_object.dart';
import 'package:hive/src/object/hive_object.dart';

import 'base_model/base_model.dart';

class BookInfoModel implements BaseBusinessModel {
  String? boxId;
  bool isBought;
  int id;
  String title;
  String des;
  String author;
  String coverUrl;
  String networkUrl;
  int price;

  BookInfoModel({
    this.boxId,
    this.isBought = false,
    this.networkUrl = "",
    required this.id,
    required this.title,
    required this.des,
    required this.author,
    required this.coverUrl,
    required this.price,
  });

  @override
  String toString() {
    return "{\"id\": $id, \"title\": $title, \"des\": $des, \"author\": $author, \"coverUrl\": $coverUrl, \"price\": $price}";
  }

  HiveObject toHiveObject() {
    return BookHiveObject(id: id, title: title, des: des, author: author, coverLocalUrl: coverUrl);
  }

  static BookInfoModel fromHiveObject(BookHiveObject hiveObject) {
    return BookInfoModel(
      id: hiveObject.id,
      author: hiveObject.author,
      coverUrl: hiveObject.coverLocalUrl,
      des: hiveObject.des,
      price: 0,
      title: hiveObject.title,
    );
  }

  String getBoxId() {
    boxId = "${title.replaceAll(" ", "_")}_$id";
    return boxId!;
  }
}
