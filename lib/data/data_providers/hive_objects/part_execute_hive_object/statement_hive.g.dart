// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statement_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StatementHiveAdapter extends TypeAdapter<StatementHive> {
  @override
  final int typeId = 63;

  @override
  StatementHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StatementHive(
      statementTypeIdx: fields[0] as int,
      content: fields[1] as String,
      des: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, StatementHive obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.statementTypeIdx)
      ..writeByte(1)
      ..write(obj.content)
      ..writeByte(2)
      ..write(obj.des);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StatementHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
