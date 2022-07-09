// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_note_hive_object.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuestionNoteHiveObjectAdapter
    extends TypeAdapter<QuestionNoteHiveObject> {
  @override
  final int typeId = 20;

  @override
  QuestionNoteHiveObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QuestionNoteHiveObject(
      partType: fields[0] as int,
      id: fields[1] as String,
      note: fields[2] as String,
      questionNum: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, QuestionNoteHiveObject obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.partType)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.note)
      ..writeByte(3)
      ..write(obj.questionNum);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuestionNoteHiveObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
