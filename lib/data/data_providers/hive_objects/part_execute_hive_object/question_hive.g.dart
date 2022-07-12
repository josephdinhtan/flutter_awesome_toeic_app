// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuestionHiveAdapter extends TypeAdapter<QuestionHive> {
  @override
  final int typeId = 62;

  @override
  QuestionHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuestionHive(
      number: fields[0] as int,
      questionStr: fields[1] as String?,
      answers: (fields[2] as List?)?.cast<String>(),
      correctAnsIdx: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, QuestionHive obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.number)
      ..writeByte(1)
      ..write(obj.questionStr)
      ..writeByte(2)
      ..write(obj.answers)
      ..writeByte(3)
      ..write(obj.correctAnsIdx);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuestionHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
