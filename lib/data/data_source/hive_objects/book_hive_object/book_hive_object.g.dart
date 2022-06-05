// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_hive_object.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookHiveObjectAdapter extends TypeAdapter<BookHiveObject> {
  @override
  final int typeId = 1;

  @override
  BookHiveObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookHiveObject(
      id: fields[0] as String,
      title: fields[1] as String,
      des: fields[2] as String,
      author: fields[3] as String,
      coverLocalUrl: fields[4] as String,
      childId: (fields[5] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, BookHiveObject obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.des)
      ..writeByte(3)
      ..write(obj.author)
      ..writeByte(4)
      ..write(obj.coverLocalUrl)
      ..writeByte(5)
      ..write(obj.childId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookHiveObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
