import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'app.dart';
import 'core_utils/core_utils.dart';
import 'data/data_providers/hive_objects/book_hive_object/book_hive_object.dart';
import 'data/data_providers/hive_objects/part_execute_hive_object/part_four_hive_object.dart';
import 'data/data_providers/hive_objects/part_execute_hive_object/part_one_hive_object.dart';
import 'data/data_providers/hive_objects/part_execute_hive_object/part_three_hive_object.dart';
import 'data/data_providers/hive_objects/part_execute_hive_object/part_two_hive_object.dart';
import 'data/data_providers/hive_objects/part_execute_hive_object/question_group_hive.dart';
import 'data/data_providers/hive_objects/part_execute_hive_object/question_hive.dart';
import 'data/data_providers/hive_objects/part_execute_hive_object/statement_hive.dart';
import 'data/data_providers/hive_objects/part_hive_object/part_hive_object.dart';
import 'data/data_providers/hive_objects/question_note_hive_object/question_note_hive_object.dart';
import 'data/data_providers/hive_objects/test_hive_object/test_hive_object.dart';
import 'data/di/injection.dart';
import 'domain/user_settings_use_case/get_theme_color_use_case.dart';
import 'domain/user_settings_use_case/get_theme_enable_use_case.dart';
import 'firebase_options.dart';

late ThemeMode userSettingsThemeMode;
void main() async {
  if (kIsWeb) {
    await globalInitializerForWeb();
  } else {
    await globalInitializerForMobile();
  }
  configureDependencies();
  final themeColorSetting = await GetIt.I.get<GetThemeColorUseCase>().perform();
  final themeModeSetting = await GetIt.I.get<GetThemeEnableUseCase>().perform();
  setApplicationThemeColor(themeColorSetting);
  setApplicationThemeMode(themeModeSetting);

  runApp(const MyApp());
}

Future<void> globalInitializerForWeb() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

Future<void> globalInitializerForMobile() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  setApplicationDirectory(dir.path);
  Hive.init(dir.path);
  Hive.registerAdapter(BookHiveObjectAdapter());
  Hive.registerAdapter(TestHiveObjectAdapter());
  Hive.registerAdapter(PartHiveObjectAdapter());
  Hive.registerAdapter(PartOneHiveObjectAdapter());
  Hive.registerAdapter(PartTwoHiveObjectAdapter());
  Hive.registerAdapter(PartThreeHiveObjectAdapter());
  Hive.registerAdapter(PartFourHiveObjectAdapter());
  Hive.registerAdapter(QuestionNoteHiveObjectAdapter());

  Hive.registerAdapter(QuestionGroupHiveAdapter());
  Hive.registerAdapter(QuestionHiveAdapter());
  Hive.registerAdapter(StatementHiveAdapter());

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
