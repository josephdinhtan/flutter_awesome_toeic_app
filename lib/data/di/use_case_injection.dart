import 'package:get_it/get_it.dart';

import '../../domain/download_use_case/download_book_cover_use_case.dart';
import '../../domain/download_use_case/download_test_use_case.dart';
import '../../domain/download_use_case/test_fetching_data_use_case.dart';
import '../../domain/execute_use_cases/get_part_five_question_list_use_case.dart';
import '../../domain/execute_use_cases/get_part_four_question_list_use_case.dart';
import '../../domain/execute_use_cases/get_part_one_question_list_use_case.dart';
import '../../domain/execute_use_cases/get_part_seven_question_list_use_case.dart';
import '../../domain/execute_use_cases/get_part_six_question_list_use_case.dart';
import '../../domain/execute_use_cases/get_part_three_question_list_use_case.dart';
import '../../domain/execute_use_cases/get_part_two_question_list_use_case.dart';
import '../../domain/execute_use_cases/save_question_to_favorite_use_case.dart';
import '../../domain/get_book_detail_use_case/get_list_book_use_case.dart';
import '../../domain/get_book_detail_use_case/get_list_part_use_case.dart';
import '../../domain/get_book_detail_use_case/get_list_test_use_case.dart';
import '../../domain/get_from_network_use_case/get_store_item_list_use_case.dart';
import '../../domain/save_to_db_use_cases/save_book_to_db_use_case.dart';
import '../../domain/save_to_db_use_cases/update_test_is_downloaded_to_db.dart';
import '../../domain/user_settings_use_case/get_theme_enable_use_case.dart';
import '../../domain/user_settings_use_case/set_theme_enable_use_case.dart';

final getIt = GetIt.instance;

class UseCaseInjection {
  static configureDependencies() {
    // use cases
    getIt.registerLazySingleton<GetListBookUseCase>(() => GetListBookUseCase());
    getIt.registerLazySingleton<GetListTestUseCase>(() => GetListTestUseCase());
    getIt.registerLazySingleton<GetListPartUseCase>(() => GetListPartUseCase());

    // settings use cases
    getIt.registerLazySingleton<GetThemeEnableUseCase>(
        () => GetThemeEnableUseCase());
    getIt.registerLazySingleton<SetThemeEnableUseCase>(
        () => SetThemeEnableUseCase());

    // store use cases
    getIt.registerLazySingleton<GetStoreItemListUseCase>(
        () => GetStoreItemListUseCase());
    getIt.registerLazySingleton<SaveBookToDbUseCase>(
        () => SaveBookToDbUseCase());
    getIt.registerLazySingleton<UpdateTestIsDownloadedToDB>(
        () => UpdateTestIsDownloadedToDB());

    // download use cases
    getIt.registerLazySingleton<DownloadBookCoverUseCase>(
        () => DownloadBookCoverUseCase());
    getIt.registerLazySingleton<DownloadTestUseCase>(
        () => DownloadTestUseCase());
    getIt.registerLazySingleton<TestFetchingDataUseCase>(
        () => TestFetchingDataUseCase());

    getIt.registerLazySingleton<GetPartOneQuestionListUseCase>(
        () => GetPartOneQuestionListUseCase());
    getIt.registerLazySingleton<GetPartTwoQuestionListUseCase>(
        () => GetPartTwoQuestionListUseCase());
    getIt.registerLazySingleton<GetPartThreeQuestionListUseCase>(
        () => GetPartThreeQuestionListUseCase());
    getIt.registerLazySingleton<GetPartFourQuestionListUseCase>(
        () => GetPartFourQuestionListUseCase());
    getIt.registerLazySingleton<GetPartFiveQuestionListUseCase>(
        () => GetPartFiveQuestionListUseCase());
    getIt.registerLazySingleton<GetPartSixQuestionListUseCase>(
        () => GetPartSixQuestionListUseCase());
    getIt.registerLazySingleton<GetPartSevenQuestionListUseCase>(
        () => GetPartSevenQuestionListUseCase());
    getIt.registerLazySingleton<SaveQuestionToFavoriteUseCase>(
        () => SaveQuestionToFavoriteUseCase());
  }
}
