// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_hive_object.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SettingsHiveObjectAdapter extends TypeAdapter<SettingsHiveObject> {
  @override
  final int typeId = 20;

  @override
  SettingsHiveObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SettingsHiveObject(
      id: fields[0] as String,
      themeMode: fields[1] as int,
      language: fields[2] as String,
      enableNotification: fields[3] as bool,
      hourNotification: (fields[4] as List).cast<int>(),
      minuteNotification: (fields[5] as List).cast<int>(),
      ver: fields[6] as int,
    );
  }

  @override
  void write(BinaryWriter writer, SettingsHiveObject obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.themeMode)
      ..writeByte(2)
      ..write(obj.language)
      ..writeByte(3)
      ..write(obj.enableNotification)
      ..writeByte(4)
      ..write(obj.hourNotification)
      ..writeByte(5)
      ..write(obj.minuteNotification)
      ..writeByte(6)
      ..write(obj.ver);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingsHiveObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
