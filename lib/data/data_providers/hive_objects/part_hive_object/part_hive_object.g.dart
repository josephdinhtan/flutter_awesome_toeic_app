// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'part_hive_object.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PartHiveObjectAdapter extends TypeAdapter<PartHiveObject> {
  @override
  final int typeId = 3;

  @override
  PartHiveObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PartHiveObject(
      id: fields[0] as String,
      title: fields[1] as String,
      partType: fields[2] as int,
      numOfQuestion: fields[3] as int,
      numOfCorrect: fields[4] as int?,
      ver: fields[5] as int,
      questionIds: (fields[6] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, PartHiveObject obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.partType)
      ..writeByte(3)
      ..write(obj.numOfQuestion)
      ..writeByte(4)
      ..write(obj.numOfCorrect)
      ..writeByte(5)
      ..write(obj.ver)
      ..writeByte(6)
      ..write(obj.questionIds);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PartHiveObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
