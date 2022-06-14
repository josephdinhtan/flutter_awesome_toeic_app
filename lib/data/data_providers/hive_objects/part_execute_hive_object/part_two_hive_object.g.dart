// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'part_two_hive_object.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PartTwoHiveObjectAdapter extends TypeAdapter<PartTwoHiveObject> {
  @override
  final int typeId = 12;

  @override
  PartTwoHiveObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PartTwoHiveObject(
      number: fields[0] as int,
      id: fields[1] as String,
      audioPath: fields[2] as String,
      correctAnswerIndex: fields[3] as int,
      question: fields[4] as String,
      answers: (fields[5] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, PartTwoHiveObject obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.number)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.audioPath)
      ..writeByte(3)
      ..write(obj.correctAnswerIndex)
      ..writeByte(4)
      ..write(obj.question)
      ..writeByte(5)
      ..write(obj.answers);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PartTwoHiveObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
