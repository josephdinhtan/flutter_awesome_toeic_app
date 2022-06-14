// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

part 'book_hive_object.g.dart';

@HiveType(typeId: 1)
class BookHiveObject extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String des;
  @HiveField(3)
  String author;
  @HiveField(4)
  String coverPath;
  @HiveField(5)
  List<String> testIds;
  @HiveField(6)
  String price;

  BookHiveObject({
    required this.id,
    required this.title,
    required this.des,
    required this.author,
    required this.coverPath,
    required this.testIds,
    required this.price,
  });
}
