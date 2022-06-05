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
      title: fields[0] as String,
      memorySize: fields[1] as String,
      questionNumber: fields[2] as int,
      resourceUrl: fields[3] as String,
      isDownloaded: fields[4] as bool,
      actualScore: fields[5] as int,
      version: fields[6] as int,
    );
  }

  @override
  void write(BinaryWriter writer, TestHiveObject obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.memorySize)
      ..writeByte(2)
      ..write(obj.questionNumber)
      ..writeByte(3)
      ..write(obj.resourceUrl)
      ..writeByte(4)
      ..write(obj.isDownloaded)
      ..writeByte(5)
      ..write(obj.actualScore)
      ..writeByte(6)
      ..write(obj.version);
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
