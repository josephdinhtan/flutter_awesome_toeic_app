import 'package:get_it/get_it.dart';

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
import '../../view_model/settings_screen_cubit/settings_screen_cubit.dart';
import '../../view_model/store_screen_cubit/store_screen_cubit.dart';
import '../../view_model/test_screen_cubit/test_download_cubit.dart';
import '../../view_model/test_screen_cubit/test_list_cubit.dart';

final getIt = GetIt.instance;

class CubitInjection {
  static void configureDependencies() {
    getIt.registerFactory<HomeScreenCubit>(() => HomeScreenCubit());
    getIt.registerFactory<SettingsScreenCubit>(() => SettingsScreenCubit());
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
  }
}
