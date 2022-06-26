// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_toeic_quiz2/data/data_providers/hive_objects/settings_hive_object/settings_hive_object.dart';
import 'package:hive/hive.dart';

import '../data_providers/hive_objects/part_hive_object/part_hive_object.dart';
import 'base_model/base_business_model.dart';

class SettingsModel implements BaseBusinessModel {
  final String id;
  ThemeMode themeMode;
  String language;
  bool enableNotification;
  List<TimeOfDay> timeNotification;
  int ver;

  SettingsModel({
    required this.id,
    required this.themeMode,
    required this.language,
    required this.enableNotification,
    required this.timeNotification,
    required this.ver,
  });

  SettingsHiveObject toHiveObject() {
    return SettingsHiveObject(
      id: id,
      enableNotification: enableNotification,
      language: language,
      themeMode: themeMode.index,
      hourNotification: _getListHour(),
      minuteNotification: _getListMinutes(),
      ver: ver,
    );
  }

  List<int> _getListHour() {
    List<int> res = [];
    for (TimeOfDay time in timeNotification) {
      res.add(time.hour);
    }
    return res;
  }

  List<int> _getListMinutes() {
    List<int> res = [];
    for (TimeOfDay time in timeNotification) {
      res.add(time.minute);
    }
    return res;
  }

  static List<TimeOfDay> _getListTimeOfDay(
      List<int> hourList, List<int> minuteList) {
    List<TimeOfDay> res = [];
    for (int i = 0; i < hourList.length; i++) {
      res.add(TimeOfDay(hour: hourList[i], minute: minuteList[i]));
    }
    return res;
  }

  factory SettingsModel.fromHiveObject(SettingsHiveObject hiveObject) {
    return SettingsModel(
      id: hiveObject.id,
      enableNotification: hiveObject.enableNotification,
      language: hiveObject.language,
      themeMode: ThemeMode.values[hiveObject.themeMode],
      timeNotification: _getListTimeOfDay(
          hiveObject.hourNotification, hiveObject.minuteNotification),
      ver: hiveObject.ver,
    );
  }
}

enum PartType { part1, part2, part3, part4, part5, part6, part7 }
