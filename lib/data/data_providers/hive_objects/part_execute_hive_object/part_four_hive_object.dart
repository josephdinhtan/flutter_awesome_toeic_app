// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

part 'part_four_hive_object.g.dart';

@HiveType(typeId: 14)
class PartFourHiveObject extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String audioPath;
  @HiveField(2)
  String? picturePath;
  @HiveField(3)
  String statement; // display open button
  @HiveField(4)
  List<int> numbers;
  @HiveField(5)
  List<int> correctAnsIndexes;
  @HiveField(6)
  List<String> questions;
  @HiveField(7)
  List<List<String>> answers;

  PartFourHiveObject({
    required this.id,
    required this.audioPath,
    required this.picturePath,
    required this.statement,
    required this.numbers,
    required this.correctAnsIndexes,
    required this.questions,
    required this.answers,
  });
}
