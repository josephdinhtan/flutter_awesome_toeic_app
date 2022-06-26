import 'package:get_it/get_it.dart';

import '../data_providers/daos/book_dao.dart';
import '../data_providers/daos/part_dao.dart';
import '../data_providers/daos/part_execute_daos/part_five_dao.dart';
import '../data_providers/daos/part_execute_daos/part_four_dao.dart';
import '../data_providers/daos/part_execute_daos/part_one_dao.dart';
import '../data_providers/daos/part_execute_daos/part_seven_dao.dart';
import '../data_providers/daos/part_execute_daos/part_six_dao.dart';
import '../data_providers/daos/part_execute_daos/part_three_dao.dart';
import '../data_providers/daos/part_execute_daos/part_two_dao.dart';
import '../data_providers/daos/settings_dao/settings_dao.dart';
import '../data_providers/daos/test_dao.dart';

final getIt = GetIt.instance;

class DaoInjection {
  static void configureDependencies() {
    // DAO
    getIt.registerLazySingleton<SettingsDao>(() => SettingsDao());
    getIt.registerLazySingleton<BookDao>(() => BookDao());
    getIt.registerLazySingleton<TestDao>(() => TestDao());
    getIt.registerLazySingleton<PartDao>(() => PartDao());

    getIt.registerLazySingleton<PartOneDao>(() => PartOneDao());
    getIt.registerLazySingleton<PartTwoDao>(() => PartTwoDao());
    getIt.registerLazySingleton<PartThreeDao>(() => PartThreeDao());
    getIt.registerLazySingleton<PartFourDao>(() => PartFourDao());
    getIt.registerLazySingleton<PartFiveDao>(() => PartFiveDao());
    getIt.registerLazySingleton<PartSixDao>(() => PartSixDao());
    getIt.registerLazySingleton<PartSevenDao>(() => PartSevenDao());
  }
}
