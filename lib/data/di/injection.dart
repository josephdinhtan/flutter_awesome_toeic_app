import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../core_ui/constants/app_colors/app_color.dart';
import '../../core_ui/constants/app_colors/app_dark_color_impl.dart';
import '../../core_ui/constants/app_colors/app_light_color_impl.dart';
import '../../core_utils/core_utils.dart';
import '../../presentation/router/app_router.dart';
import 'api_injection.dart';
import 'cubit_injection.dart';
import 'dao_injection.dart';
import 'repository_injection.dart';
import 'use_case_injection.dart';

void configureDependencies() {
  GetIt.I.registerFactory<AppRouter>(() => AppRouter());
  GetIt.I.registerLazySingleton<AppDarkColorImpl>(() => AppDarkColorImpl());
  GetIt.I.registerLazySingleton<AppLightColorImpl>(() => AppLightColorImpl());
  GetIt.I.registerFactory<AppColor>(() =>
      getApplicationBrightness() == ThemeMode.dark
          ? GetIt.I.get<AppDarkColorImpl>()
          : GetIt.I.get<AppLightColorImpl>());

  UseCaseInjection.configureDependencies();
  CubitInjection.configureDependencies();
  RepositoryInjection.configureDependencies();
  ApiInjection.configureDependencies();
  DaoInjection.configureDependencies();
}
