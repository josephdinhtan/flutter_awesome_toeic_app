// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'part_one_hive_object.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PartOneHiveObjectAdapter extends TypeAdapter<PartOneHiveObject> {
  @override
  final int typeId = 11;

  @override
  PartOneHiveObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PartOneHiveObject(
      number: fields[0] as int,
      id: fields[1] as String,
      audioPath: fields[2] as String,
      picturePath: fields[3] as String,
      correctAnswerIndex: fields[4] as int,
      answers: (fields[5] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, PartOneHiveObject obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.number)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.audioPath)
      ..writeByte(3)
      ..write(obj.picturePath)
      ..writeByte(4)
      ..write(obj.correctAnswerIndex)
      ..writeByte(5)
      ..write(obj.answers);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PartOneHiveObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
