import 'package:hive/hive.dart';

part 'statement_hive.g.dart';

@HiveType(typeId: 63)
class StatementHive extends HiveObject {
  @HiveField(0)
  int statementTypeIdx;
  @HiveField(1)
  String content;
  StatementHive({
    required this.statementTypeIdx,
    required this.content,
  });
}
