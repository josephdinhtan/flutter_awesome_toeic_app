import 'package:get_it/get_it.dart';

import '../../domain/download_use_case/download_book_cover_use_case.dart';
import '../../domain/download_use_case/download_test_use_case.dart';
import '../../domain/download_use_case/test_fetching_data_use_case.dart';
import '../../domain/execute_use_cases/get_question_group_use_case.dart';
import '../../domain/execute_use_cases/save_question_group_use_case.dart';
import '../../domain/execute_use_cases/save_question_to_favorite_use_case.dart';
import '../../domain/get_book_detail_use_case/get_list_book_use_case.dart';
import '../../domain/get_book_detail_use_case/get_part_list_use_case.dart';
import '../../domain/get_book_detail_use_case/get_test_list_use_case.dart';
import '../../domain/get_book_detail_use_case/save_score_test_use_case.dart';
import '../../domain/get_book_detail_use_case/save_part_list_use_case.dart';
import '../../domain/get_from_network_use_case/get_store_item_list_use_case.dart';
import '../../domain/question_note_use_case/read_all_question_note_use_case.dart';
import '../../domain/question_note_use_case/read_question_note_use_case.dart';
import '../../domain/question_note_use_case/remove_question_note_use_case.dart';
import '../../domain/question_note_use_case/save_question_note_use_case.dart';
import '../../domain/save_to_db_use_cases/save_book_to_db_use_case.dart';
import '../../domain/save_to_db_use_cases/update_test_is_downloaded_to_db.dart';
import '../../domain/user_settings_use_case/get_theme_color_use_case.dart';
import '../../domain/user_settings_use_case/get_theme_enable_use_case.dart';
import '../../domain/user_settings_use_case/set_theme_color_use_case.dart';
import '../../domain/user_settings_use_case/set_theme_mode_use_case.dart';

class UseCaseInjection {
  static configureDependencies() {
    // use cases
    GetIt.I
        .registerLazySingleton<GetListBookUseCase>(() => GetListBookUseCase());
    GetIt.I
        .registerLazySingleton<GetTestListUseCase>(() => GetTestListUseCase());
    GetIt.I.registerLazySingleton<SaveScoreTestUseCase>(
        () => SaveScoreTestUseCase());
    GetIt.I.registerLazySingleton<SavePartListUseCase>(
        () => SavePartListUseCase());
    GetIt.I
        .registerLazySingleton<GetPartListUseCase>(() => GetPartListUseCase());
    GetIt.I.registerLazySingleton<GetQuestionGroupListUseCase>(
        () => GetQuestionGroupListUseCase());
    GetIt.I.registerLazySingleton<SaveQuestionGroupListUseCase>(
        () => SaveQuestionGroupListUseCase());

    // question note use case
    GetIt.I.registerLazySingleton<SaveQuestionNoteUseCase>(
        () => SaveQuestionNoteUseCase());
    GetIt.I.registerLazySingleton<ReadAllQuestionNoteUseCase>(
        () => ReadAllQuestionNoteUseCase());
    GetIt.I.registerLazySingleton<ReadQuestionNoteUseCase>(
        () => ReadQuestionNoteUseCase());
    GetIt.I.registerLazySingleton<RemoveQuestionNoteUseCase>(
        () => RemoveQuestionNoteUseCase());

    // settings use cases
    GetIt.I.registerLazySingleton<GetThemeColorUseCase>(
        () => GetThemeColorUseCase());
    GetIt.I.registerLazySingleton<GetThemeEnableUseCase>(
        () => GetThemeEnableUseCase());
    GetIt.I.registerLazySingleton<SetThemeModeUseCase>(
        () => SetThemeModeUseCase());
    GetIt.I.registerLazySingleton<SetThemeColorUseCase>(
        () => SetThemeColorUseCase());

    // store use cases
    GetIt.I.registerLazySingleton<GetStoreItemListUseCase>(
        () => GetStoreItemListUseCase());
    GetIt.I.registerLazySingleton<SaveBookToDbUseCase>(
        () => SaveBookToDbUseCase());
    GetIt.I.registerLazySingleton<UpdateTestIsDownloadedToDB>(
        () => UpdateTestIsDownloadedToDB());

    // download use cases
    GetIt.I.registerLazySingleton<DownloadBookCoverUseCase>(
        () => DownloadBookCoverUseCase());
    GetIt.I.registerLazySingleton<DownloadTestUseCase>(
        () => DownloadTestUseCase());
    GetIt.I.registerLazySingleton<TestFetchingDataUseCase>(
        () => TestFetchingDataUseCase());
    GetIt.I.registerLazySingleton<SaveQuestionToFavoriteUseCase>(
        () => SaveQuestionToFavoriteUseCase());
  }
}
