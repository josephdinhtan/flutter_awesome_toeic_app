import 'package:flutter_toeic_quiz2/data/data_source/hive_objects/book_hive_object/book_hive_object.dart';
import 'package:hive/src/object/hive_object.dart';

import 'base_model/base_business_model.dart';

class BookInfoModel implements BaseBusinessModel {
  String id;
  String title;
  String des;
  String author;
  String coverPath;
  List<String> testIds;
  String price;

  BookInfoModel({
    required this.id,
    required this.testIds,
    required this.title,
    required this.des,
    required this.author,
    required this.coverPath,
    required this.price,
  });

  @override
  String toString() {
    return "{\"id\": $id, \"title\": $title, \"des\": $des, \"author\": $author, \"coverUrl\": $coverPath, \"price\": $price, childId: $testIds}";
  }

  HiveObject toHiveObject() {
    return BookHiveObject(
      id: id,
      title: title,
      des: des,
      author: author,
      coverPath: coverPath,
      testIds: testIds,
      price: price,
    );
  }

  factory BookInfoModel.fromHiveObject(BookHiveObject hiveObject) {
    return BookInfoModel(
      id: hiveObject.id,
      author: hiveObject.author,
      coverPath: hiveObject.coverPath,
      des: hiveObject.des,
      price: hiveObject.price,
      title: hiveObject.title,
      testIds: hiveObject.testIds,
    );
  }
}
