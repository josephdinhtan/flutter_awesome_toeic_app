import 'package:get_it/get_it.dart';

import '../../view_model/book_screen_cubit/book_list_cubit.dart';
import '../../view_model/execute_screen_cubit/execute_screen_cubit.dart';
import '../../view_model/execute_screen_cubit/part_five_cubit/part_five_cubit.dart';
import '../../view_model/execute_screen_cubit/part_four_cubit/part_four_cubit.dart';
import '../../view_model/execute_screen_cubit/part_one_cubit/part_one_cubit.dart';
import '../../view_model/execute_screen_cubit/part_seven_cubit/part_seven_cubit.dart';
import '../../view_model/execute_screen_cubit/part_six_cubit/part_six_cubit.dart';
import '../../view_model/execute_screen_cubit/part_three_cubit/part_three_cubit.dart';
import '../../view_model/execute_screen_cubit/part_two_cubit/part_two_cubit.dart';
import '../../view_model/favorite_screen_cubit/cubit/favorite_screen_cubit.dart';
import '../../view_model/home_screen_cubit/home_screen_cubit.dart';
import '../../view_model/part_screen_cubit/part_list_cubit.dart';
import '../../view_model/settings_screen_cubit/settings_screen_cubit.dart';
import '../../view_model/store_screen_cubit/store_screen_cubit.dart';
import '../../view_model/test_screen_cubit/test_download_cubit.dart';
import '../../view_model/test_screen_cubit/test_list_cubit.dart';

class CubitInjection {
  static void configureDependencies() {
    GetIt.I.registerFactory<FavoriteScreenCubit>(() => FavoriteScreenCubit());
    GetIt.I.registerFactory<HomeScreenCubit>(() => HomeScreenCubit());
    GetIt.I.registerFactory<SettingsScreenCubit>(() => SettingsScreenCubit());
    GetIt.I.registerFactory<StoreScreenCubit>(() => StoreScreenCubit());
    GetIt.I.registerFactory<BookListCubit>(() => BookListCubit());
    GetIt.I.registerFactory<TestListCubit>(() => TestListCubit());
    GetIt.I.registerFactory<TestDownloadCubit>(() => TestDownloadCubit());

    GetIt.I.registerFactory<ExecuteScreenCubit>(() => ExecuteScreenCubit());

    GetIt.I.registerFactory<PartListCubit>(() => PartListCubit());
    GetIt.I.registerFactory<PartOneCubit>(() => PartOneCubit());
    GetIt.I.registerFactory<PartTwoCubit>(() => PartTwoCubit());
    GetIt.I.registerFactory<PartThreeCubit>(() => PartThreeCubit());
    GetIt.I.registerFactory<PartFourCubit>(() => PartFourCubit());
    GetIt.I.registerFactory<PartFiveCubit>(() => PartFiveCubit());
    GetIt.I.registerFactory<PartSixCubit>(() => PartSixCubit());
    GetIt.I.registerFactory<PartSevenCubit>(() => PartSevenCubit());
  }
}
