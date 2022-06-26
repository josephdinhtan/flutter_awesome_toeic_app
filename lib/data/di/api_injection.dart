import 'package:get_it/get_it.dart';

import '../data_providers/apis/book_api.dart';
import '../data_providers/apis/part_api.dart';
import '../data_providers/apis/part_execute_apis/part_five_api.dart';
import '../data_providers/apis/part_execute_apis/part_four_api.dart';
import '../data_providers/apis/part_execute_apis/part_one_api.dart';
import '../data_providers/apis/part_execute_apis/part_seven_api.dart';
import '../data_providers/apis/part_execute_apis/part_six_api.dart';
import '../data_providers/apis/part_execute_apis/part_three_api.dart';
import '../data_providers/apis/part_execute_apis/part_two_api.dart';
import '../data_providers/apis/test_api.dart';

final getIt = GetIt.instance;

class ApiInjection {
  static void configureDependencies() {
    // API
    getIt.registerLazySingleton<BookApi>(() => BookApi());
    getIt.registerLazySingleton<TestApi>(() => TestApi());
    getIt.registerLazySingleton<PartApi>(() => PartApi());
    getIt.registerLazySingleton<PartOneApi>(() => PartOneApi());
    getIt.registerLazySingleton<PartTwoApi>(() => PartTwoApi());
    getIt.registerLazySingleton<PartThreeApi>(() => PartThreeApi());
    getIt.registerLazySingleton<PartFourApi>(() => PartFourApi());
    getIt.registerLazySingleton<PartFiveApi>(() => PartFiveApi());
    getIt.registerLazySingleton<PartSixApi>(() => PartSixApi());
    getIt.registerLazySingleton<PartSevenApi>(() => PartSevenApi());
  }
}
