import 'dart:developer';

import 'package:hive/hive.dart';

import '../../../../core_utils/global_configuration.dart';
import '../../../business_models/settings_model.dart';
import '../../hive_objects/settings_hive_object/settings_hive_object.dart';
import '../base_dao/base_dao.dart';
import '../box_name.dart';

const _logTag = "SettingsDAO";

class SettingsDao implements BaseDao<SettingsModel, SettingsHiveObject> {
  @override
  Future<bool> insert(HiveObject item, String hiveId) async {
    try {
      if (logEnable) log("$_logTag addItem() openBox started");
      await Hive.openBox(BoxName.USER_SETTINGS_BOX_NAME);
      if (logEnable) log("$_logTag addItem() openBox done");
    } catch (e) {
      if (logEnable) log("$_logTag addItem() ${e.toString()}");
      return false;
    }
    final settingsBox = Hive.box(BoxName.USER_SETTINGS_BOX_NAME);
    if (logEnable) {
      log("$_logTag addItem() settingsBox.length: ${settingsBox.length}");
    }
    await settingsBox.put(hiveId, item);
    if (logEnable) log("$_logTag addItem() settingsBox put done");
    return true;
  }

  @override
  Future<SettingsModel?> query(String hiveId) async {
    try {
      await Hive.openBox(BoxName.USER_SETTINGS_BOX_NAME);
    } catch (e) {
      log("$_logTag getItem() ${e.toString()}");
      return null;
    }
    final settingsBox = Hive.box(BoxName.USER_SETTINGS_BOX_NAME);
    final hiveObject = await settingsBox.get(hiveId, defaultValue: null);
    if (hiveObject == null) return null;
    return SettingsModel.fromHiveObject(hiveObject);
  }

  @override
  Future<bool> delete(String hiveId) async {
    try {
      await Hive.openBox(BoxName.USER_SETTINGS_BOX_NAME);
    } catch (e) {
      log("$_logTag removeItem() ${e.toString()}");
      return false;
    }
    final settingsBox = Hive.box(BoxName.USER_SETTINGS_BOX_NAME);
    await settingsBox.delete(hiveId);
    return true;
  }

  @override
  Future<bool> update(HiveObject item) {
    throw UnimplementedError();
  }

  @override
  Future<List<SettingsModel>> queryAll(List<String> hiveIds) async {
    List<SettingsModel> settingsInfoModelList = [];
    try {
      await Hive.openBox(BoxName.USER_SETTINGS_BOX_NAME);
    } catch (e) {
      return settingsInfoModelList;
    }
    final settingsBox = Hive.box(BoxName.USER_SETTINGS_BOX_NAME);
    for (int i = 0; i < settingsBox.length; i++) {
      settingsInfoModelList.add(SettingsModel.fromHiveObject(
          settingsBox.getAt(i) as SettingsHiveObject));
    }
    return settingsInfoModelList;
  }
}
