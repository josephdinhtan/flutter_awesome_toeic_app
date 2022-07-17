import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:get_it/get_it.dart';

import '../repositories/book_repository/book_mobile_repository_impl.dart';
import '../repositories/book_repository/book_repository.dart';
import '../repositories/book_repository/book_web_repository_impl.dart';
import '../repositories/part_repository/part_mobile_repository_impl.dart';
import '../repositories/part_repository/part_repository.dart';
import '../repositories/part_repository/part_web_repository_impl.dart';
import '../repositories/question_group_repository/question_group_mobile_repository_impl.dart';
import '../repositories/question_group_repository/question_group_repository.dart';
import '../repositories/question_group_repository/question_group_web_repository_impl.dart';
import '../repositories/settings_repository/settings_mobile_repository_impl.dart';
import '../repositories/settings_repository/settings_repository.dart';
import '../repositories/settings_repository/settings_web_repository_impl.dart';
import '../repositories/store_repository/store_repository.dart';
import '../repositories/store_repository/store_repository_impl.dart';
import '../repositories/test_repository/test_mobile_repository_impl.dart';
import '../repositories/test_repository/test_repository.dart';
import '../repositories/test_repository/test_web_repository_impl.dart';

final getIt = GetIt.instance;

class RepositoryInjection {
  static void configureDependencies() {
    // repositories
    getIt.registerLazySingleton<SettingsRepository>(() =>
        kIsWeb ? SettingsWebRepositoryImpl() : SettingsMobileRepositoryImpl());
    getIt.registerFactory<StoreRepository>(() => StoreRepositoryImpl());
    getIt.registerLazySingleton<BookRepository>(
        () => kIsWeb ? BookWebRepositoryImpl() : BookMobileRepositoryImpl());
    getIt.registerLazySingleton<TestRepository>(
        () => kIsWeb ? TestWebRepositoryImpl() : TestMobileRepositoryImpl());
    getIt.registerLazySingleton<PartRepository>(
        () => kIsWeb ? PartWebRepositoryImpl() : PartMobileRepositoryImpl());
    getIt.registerLazySingleton<QuestionGroupRepository>(() => kIsWeb
        ? QuestionGroupWebRepositoryImpl()
        : QuestionGroupMobileRepositoryImpl());
  }
}
