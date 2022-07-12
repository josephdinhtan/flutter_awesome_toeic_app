import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:get_it/get_it.dart';

import '../repositories/book_repository/book_mobile_repository_impl.dart';
import '../repositories/book_repository/book_repository.dart';
import '../repositories/book_repository/book_web_repository_impl.dart';
import '../repositories/execute_repository/part_five_repository/part_five_mobile_repository_impl.dart';
import '../repositories/execute_repository/part_five_repository/part_five_repository.dart';
import '../repositories/execute_repository/part_five_repository/part_five_web_repository_impl.dart';
import '../repositories/execute_repository/part_four_repository/part_four_mobile_repository_impl.dart';
import '../repositories/execute_repository/part_four_repository/part_four_repository.dart';
import '../repositories/execute_repository/part_four_repository/part_four_web_repository_impl.dart';
import '../repositories/execute_repository/part_one_repository/part_one_mobile_repository_impl.dart';
import '../repositories/execute_repository/part_one_repository/part_one_repository.dart';
import '../repositories/execute_repository/part_one_repository/part_one_web_repository_impl.dart';
import '../repositories/execute_repository/part_seven_repository/part_seven_mobile_repository_impl.dart';
import '../repositories/execute_repository/part_seven_repository/part_seven_repository.dart';
import '../repositories/execute_repository/part_seven_repository/part_seven_web_repository_impl.dart';
import '../repositories/execute_repository/part_six_repository/part_six_mobile_repository_impl.dart';
import '../repositories/execute_repository/part_six_repository/part_six_repository.dart';
import '../repositories/execute_repository/part_six_repository/part_six_web_repository_impl.dart';
import '../repositories/execute_repository/part_three_repository/part_three_mobile_repository_impl.dart';
import '../repositories/execute_repository/part_three_repository/part_three_repository.dart';
import '../repositories/execute_repository/part_three_repository/part_three_web_repository_impl.dart';
import '../repositories/execute_repository/part_two_repository/part_two_mobile_repository_impl.dart';
import '../repositories/execute_repository/part_two_repository/part_two_repository.dart';
import '../repositories/execute_repository/part_two_repository/part_two_web_repository_impl.dart';
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

    getIt.registerLazySingleton<PartOneRepository>(() =>
        kIsWeb ? PartOneWebRepositoryImpl() : PartOneMobileRepositoryImpl());
    getIt.registerLazySingleton<PartTwoRepository>(() =>
        kIsWeb ? PartTwoWebRepositoryImpl() : PartTwoMobileRepositoryImpl());
    getIt.registerLazySingleton<PartThreeRepository>(() => kIsWeb
        ? PartThreeWebRepositoryImpl()
        : PartThreeMobileRepositoryImpl());
    getIt.registerLazySingleton<PartFourRepository>(() =>
        kIsWeb ? PartFourWebRepositoryImpl() : PartFourMobileRepositoryImpl());
    getIt.registerLazySingleton<PartFiveRepository>(() =>
        kIsWeb ? PartFiveWebRepositoryImpl() : PartFiveMobileRepositoryImpl());
    getIt.registerLazySingleton<PartSixRepository>(() =>
        kIsWeb ? PartSixWebRepositoryImpl() : PartSixMobileRepositoryImpl());
    getIt.registerLazySingleton<PartSevenRepository>(() => kIsWeb
        ? PartSevenWebRepositoryImpl()
        : PartSevenMobileRepositoryImpl());
  }
}
