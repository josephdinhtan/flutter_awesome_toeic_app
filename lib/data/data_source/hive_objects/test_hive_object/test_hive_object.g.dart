// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_hive_object.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TestHiveObjectAdapter extends TypeAdapter<TestHiveObject> {
  @override
  final int typeId = 2;

  @override
  TestHiveObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TestHiveObject(
      id: fields[0] as String,
      title: fields[1] as String,
      memorySize: fields[2] as String,
      numOfQuestion: fields[3] as int,
      actualScore: fields[4] as int?,
      ver: fields[5] as int,
      picturePath: fields[6] as String,
      audioPath: fields[7] as String,
      partIds: (fields[8] as List).cast<String>(),
      isResourceDownloaded: fields[9] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, TestHiveObject obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.memorySize)
      ..writeByte(3)
      ..write(obj.numOfQuestion)
      ..writeByte(4)
      ..write(obj.actualScore)
      ..writeByte(5)
      ..write(obj.ver)
      ..writeByte(6)
      ..write(obj.picturePath)
      ..writeByte(7)
      ..write(obj.audioPath)
      ..writeByte(8)
      ..write(obj.partIds)
      ..writeByte(9)
      ..write(obj.isResourceDownloaded);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TestHiveObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
