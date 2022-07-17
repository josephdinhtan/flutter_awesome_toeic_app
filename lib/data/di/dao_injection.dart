import 'package:flutter_toeic_quiz2/data/data_providers/daos/settings_dao/settings_dao.dart';
import 'package:get_it/get_it.dart';

import '../data_providers/daos/book_dao.dart';
import '../data_providers/daos/part_dao.dart';
import '../data_providers/daos/question_group_dao.dart';
import '../data_providers/daos/question_note_dao.dart';
import '../data_providers/daos/test_dao.dart';

final getIt = GetIt.instance;

class DaoInjection {
  static void configureDependencies() {
    // DAO
    getIt.registerLazySingleton<SettingsDao>(() => SettingsDao());
    getIt.registerLazySingleton<QuestionNoteDao>(() => QuestionNoteDao());
    getIt.registerLazySingleton<BookDao>(() => BookDao());
    getIt.registerLazySingleton<TestDao>(() => TestDao());
    getIt.registerLazySingleton<PartDao>(() => PartDao());
    getIt.registerLazySingleton<QuestionGroupDao>(() => QuestionGroupDao());
  }
}
