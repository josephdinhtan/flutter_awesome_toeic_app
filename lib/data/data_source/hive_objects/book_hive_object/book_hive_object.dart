import 'package:hive/hive.dart';

part 'book_hive_object.g.dart';

@HiveType(typeId: 1)
class BookHiveObject extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String des;
  @HiveField(3)
  String author;
  @HiveField(4)
  String coverLocalUrl;

  BookHiveObject({
    required this.id,
    required this.title,
    required this.des,
    required this.author,
    required this.coverLocalUrl,
  });
}
