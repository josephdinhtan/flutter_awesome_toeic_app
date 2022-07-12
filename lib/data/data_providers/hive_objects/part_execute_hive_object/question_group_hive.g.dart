// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_group_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuestionGroupHiveAdapter extends TypeAdapter<QuestionGroupHive> {
  @override
  final int typeId = 61;

  @override
  QuestionGroupHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuestionGroupHive(
      id: fields[0] as String,
      partTypeIdx: fields[1] as int,
      audioPath: fields[2] as String?,
      picturePath: fields[3] as String?,
      questions: (fields[4] as List).cast<QuestionHive>(),
      statement: (fields[5] as List?)?.cast<StatementHive>(),
    );
  }

  @override
  void write(BinaryWriter writer, QuestionGroupHive obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.partTypeIdx)
      ..writeByte(2)
      ..write(obj.audioPath)
      ..writeByte(3)
      ..write(obj.picturePath)
      ..writeByte(4)
      ..write(obj.questions)
      ..writeByte(5)
      ..write(obj.statement);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuestionGroupHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
