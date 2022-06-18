import 'package:flutter/foundation.dart' show kIsWeb;
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
import '../../presentation/router/app_router.dart';
import '../../view_model/book_screen_cubit/book_list_cubit.dart';
import '../../view_model/execute_screen_cubit/part_five_cubit/part_five_cubit.dart';
import '../../view_model/execute_screen_cubit/part_four_cubit/part_four_cubit.dart';
import '../../view_model/execute_screen_cubit/part_one_cubit/part_one_cubit.dart';
import '../../view_model/execute_screen_cubit/part_seven_cubit/part_seven_cubit.dart';
import '../../view_model/execute_screen_cubit/part_six_cubit/part_six_cubit.dart';
import '../../view_model/execute_screen_cubit/part_three_cubit/part_three_cubit.dart';
import '../../view_model/execute_screen_cubit/part_two_cubit/part_two_cubit.dart';
import '../../view_model/home_screen_cubit/home_screen_cubit.dart';
import '../../view_model/part_screen_cubit/part_list_cubit.dart';
import '../../view_model/store_screen_cubit/store_screen_cubit.dart';
import '../../view_model/test_screen_cubit/test_download_cubit.dart';
import '../../view_model/test_screen_cubit/test_list_cubit.dart';
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
import '../data_providers/daos/book_dao.dart';
import '../data_providers/daos/part_dao.dart';
import '../data_providers/daos/part_execute_daos/part_five_dao.dart';
import '../data_providers/daos/part_execute_daos/part_four_dao.dart';
import '../data_providers/daos/part_execute_daos/part_one_dao.dart';
import '../data_providers/daos/part_execute_daos/part_seven_dao.dart';
import '../data_providers/daos/part_execute_daos/part_six_dao.dart';
import '../data_providers/daos/part_execute_daos/part_three_dao.dart';
import '../data_providers/daos/part_execute_daos/part_two_dao.dart';
import '../data_providers/daos/test_dao.dart';
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
import '../repositories/store_repository/store_repository.dart';
import '../repositories/store_repository/store_repository_impl.dart';
import '../repositories/test_repository/test_mobile_repository_impl.dart';
import '../repositories/test_repository/test_repository.dart';
import '../repositories/test_repository/test_web_repository_impl.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  getIt.registerFactory<AppRouter>(() => AppRouter());

  // cubits
  getIt.registerFactory<HomeScreenCubit>(() => HomeScreenCubit());
  getIt.registerFactory<StoreScreenCubit>(() => StoreScreenCubit());
  getIt.registerFactory<BookListCubit>(() => BookListCubit());
  getIt.registerFactory<TestListCubit>(() => TestListCubit());
  getIt.registerFactory<TestDownloadCubit>(() => TestDownloadCubit());
  getIt.registerFactory<PartListCubit>(() => PartListCubit());
  getIt.registerFactory<PartOneCubit>(() => PartOneCubit());
  getIt.registerFactory<PartTwoCubit>(() => PartTwoCubit());
  getIt.registerFactory<PartThreeCubit>(() => PartThreeCubit());
  getIt.registerFactory<PartFourCubit>(() => PartFourCubit());
  getIt.registerFactory<PartFiveCubit>(() => PartFiveCubit());
  getIt.registerFactory<PartSixCubit>(() => PartSixCubit());
  getIt.registerFactory<PartSevenCubit>(() => PartSevenCubit());

  // user cases
  getIt.registerLazySingleton<GetListBookUseCase>(() => GetListBookUseCase());
  getIt.registerLazySingleton<GetListTestUseCase>(() => GetListTestUseCase());
  getIt.registerLazySingleton<GetListPartUseCase>(() => GetListPartUseCase());

  // store use cases
  getIt.registerLazySingleton<GetStoreItemListUseCase>(
      () => GetStoreItemListUseCase());
  getIt.registerLazySingleton<SaveBookToDbUseCase>(() => SaveBookToDbUseCase());
  getIt.registerLazySingleton<UpdateTestIsDownloadedToDB>(
      () => UpdateTestIsDownloadedToDB());

  // download use cases
  getIt.registerLazySingleton<DownloadBookCoverUseCase>(
      () => DownloadBookCoverUseCase());
  getIt.registerLazySingleton<DownloadTestUseCase>(() => DownloadTestUseCase());
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

  // repositories
  getIt.registerFactory<StoreRepository>(() => StoreRepositoryImpl());
  getIt.registerLazySingleton<BookRepository>(
      () => kIsWeb ? BookWebRepositoryImpl() : BookMobileRepositoryImpl());
  getIt.registerLazySingleton<TestRepository>(
      () => kIsWeb ? TestWebRepositoryImpl() : TestMobileRepositoryImpl());
  getIt.registerLazySingleton<PartRepository>(
      () => kIsWeb ? PartWebRepositoryImpl() : PartMobileRepositoryImpl());

  getIt.registerLazySingleton<PartOneRepository>(() =>
      kIsWeb ? PartOneWebRepositoryImpl() : PartOneMobileRepositoryImpl());
  getIt.registerLazySingleton<PartTwoRepository>(() =>
      kIsWeb ? PartTwoWebRepositoryImpl() : PartTwoMobileRepositoryImpl());
  getIt.registerLazySingleton<PartThreeRepository>(() =>
      kIsWeb ? PartThreeWebRepositoryImpl() : PartThreeMobileRepositoryImpl());
  getIt.registerLazySingleton<PartFourRepository>(() =>
      kIsWeb ? PartFourWebRepositoryImpl() : PartFourMobileRepositoryImpl());
  getIt.registerLazySingleton<PartFiveRepository>(() =>
      kIsWeb ? PartFiveWebRepositoryImpl() : PartFiveMobileRepositoryImpl());
  getIt.registerLazySingleton<PartSixRepository>(() =>
      kIsWeb ? PartSixWebRepositoryImpl() : PartSixMobileRepositoryImpl());
  getIt.registerLazySingleton<PartSevenRepository>(() =>
      kIsWeb ? PartSevenWebRepositoryImpl() : PartSevenMobileRepositoryImpl());

  // DAO
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
