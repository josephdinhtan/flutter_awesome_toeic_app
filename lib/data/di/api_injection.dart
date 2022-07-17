import 'package:get_it/get_it.dart';

import '../data_providers/apis/book_api.dart';
import '../data_providers/apis/part_api.dart';
import '../data_providers/apis/test_api.dart';

final getIt = GetIt.instance;

class ApiInjection {
  static void configureDependencies() {
    // API
    getIt.registerLazySingleton<BookApi>(() => BookApi());
    getIt.registerLazySingleton<TestApi>(() => TestApi());
    getIt.registerLazySingleton<PartApi>(() => PartApi());
  }
}
