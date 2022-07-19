import 'package:get_it/get_it.dart';

import '../data_providers/apis/book_api.dart';
import '../data_providers/apis/part_api.dart';
import '../data_providers/apis/question_group_api.dart';
import '../data_providers/apis/test_api.dart';

final getIt = GetIt.instance;

class ApiInjection {
  static void configureDependencies() {
    // API
    GetIt.I.registerLazySingleton<BookApi>(() => BookApi());
    GetIt.I.registerLazySingleton<TestApi>(() => TestApi());
    GetIt.I.registerLazySingleton<PartApi>(() => PartApi());
    GetIt.I.registerLazySingleton<QuestionGroupApi>(() => QuestionGroupApi());
  }
}
