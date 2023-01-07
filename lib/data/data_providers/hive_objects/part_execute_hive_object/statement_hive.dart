import 'package:hive/hive.dart';

part 'statement_hive.g.dart';

@HiveType(typeId: 63)
class StatementHive extends HiveObject {
  @HiveField(0)
  int statementTypeIdx;
  @HiveField(1)
  String content;
  @HiveField(2)
  String? des;
  StatementHive({
    required this.statementTypeIdx,
    required this.content,
    required this.des,
  });
}
