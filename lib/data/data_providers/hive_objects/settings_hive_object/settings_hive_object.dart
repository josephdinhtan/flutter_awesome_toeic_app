// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'settings_hive_object.g.dart';

@HiveType(typeId: 20)
class SettingsHiveObject extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  int themeMode;
  @HiveField(2)
  String language;
  @HiveField(3)
  bool enableNotification;
  @HiveField(4)
  List<int> hourNotification;
  @HiveField(5)
  List<int> minuteNotification;
  @HiveField(6)
  int ver;
  SettingsHiveObject({
    required this.id,
    required this.themeMode,
    required this.language,
    required this.enableNotification,
    required this.hourNotification,
    required this.minuteNotification,
    required this.ver,
  });

  factory SettingsHiveObject.fromDefault(String id) {
    return SettingsHiveObject(
      enableNotification: true,
      id: id,
      language: 'vi',
      themeMode: ThemeMode.system.index,
      hourNotification: [9],
      minuteNotification: [0],
      ver: 1,
    );
  }
}
