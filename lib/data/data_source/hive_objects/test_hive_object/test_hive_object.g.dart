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
      bookFatherBoxId: fields[0] as String,
      title: fields[1] as String,
      memorySize: fields[2] as String,
      questionNumber: fields[3] as int,
      resourceUrl: fields[4] as String,
      isDownloaded: fields[5] as bool,
      actualScore: fields[6] as int,
      version: fields[7] as int,
    );
  }

  @override
  void write(BinaryWriter writer, TestHiveObject obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.bookFatherBoxId)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.memorySize)
      ..writeByte(3)
      ..write(obj.questionNumber)
      ..writeByte(4)
      ..write(obj.resourceUrl)
      ..writeByte(5)
      ..write(obj.isDownloaded)
      ..writeByte(6)
      ..write(obj.actualScore)
      ..writeByte(7)
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
