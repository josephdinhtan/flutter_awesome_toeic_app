// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'part_four_hive_object.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PartFourHiveObjectAdapter extends TypeAdapter<PartFourHiveObject> {
  @override
  final int typeId = 14;

  @override
  PartFourHiveObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PartFourHiveObject(
      id: fields[0] as String,
      audioPath: fields[1] as String,
      picturePath: fields[2] as String?,
      statement: fields[3] as String,
      numbers: (fields[4] as List).cast<int>(),
      correctAnsIndexes: (fields[5] as List).cast<int>(),
      questions: (fields[6] as List).cast<String>(),
      answers: (fields[7] as List)
          .map((dynamic e) => (e as List).cast<String>())
          .toList(),
    );
  }

  @override
  void write(BinaryWriter writer, PartFourHiveObject obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.audioPath)
      ..writeByte(2)
      ..write(obj.picturePath)
      ..writeByte(3)
      ..write(obj.statement)
      ..writeByte(4)
      ..write(obj.numbers)
      ..writeByte(5)
      ..write(obj.correctAnsIndexes)
      ..writeByte(6)
      ..write(obj.questions)
      ..writeByte(7)
      ..write(obj.answers);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PartFourHiveObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}