import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_toeic_quiz2/view_model/execute_screen_cubit/bottom_control_bar_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../core_ui/exceptions/route_exception.dart';
import '../../core_utils/global_configuration.dart';
import '../../data/business_models/book_model.dart';
import '../../view_model/book_screen_cubit/book_list_cubit.dart';
import '../../view_model/execute_screen_cubit/execute_screen_cubit.dart';
import '../../view_model/favorite_screen_cubit/cubit/favorite_screen_cubit.dart';
import '../../view_model/part_screen_cubit/part_list_cubit.dart';
import '../../view_model/settings_screen_cubit/settings_screen_cubit.dart';
import '../../view_model/store_screen_cubit/store_screen_cubit.dart';
import '../../view_model/test_screen_cubit/test_download_cubit.dart';
import '../../view_model/test_screen_cubit/test_list_cubit.dart';
import '../screens/execute_screen/execute_screen.dart';
import '../screens/home_screen/home_screen.dart';
import '../screens/home_screen/store_screen/store_screen.dart';
import '../screens/part_screen/part_screen.dart';
import '../screens/test_screen/test_screen.dart';
import 'screen_arguments.dart';

const _logTag = "AppRouter";

class AppRouter {
  static const String home = '/';
  static const String test = '/tests';
  static const String store = '/store';
  static const String part = '/parts';
  static const String executeTest = '/execute';
  static const String practice = '/practice';
  static const String testReview = '/review';
  static const String part1Exam = '/part1exam';
  static const String part2Exam = '/part2exam';
  static const String part3Exam = '/part3exam';
  static const String part4Exam = '/part4exam';
  static const String part5Exam = '/part5exam';
  static const String part6Exam = '/part6exam';
  static const String part7Exam = '/part7exam';

  final BookListCubit _bookListCubit = GetIt.I.get<BookListCubit>();
  final FavoriteScreenCubit _favoriteScreenCubit =
      GetIt.I.get<FavoriteScreenCubit>();
  final SettingsScreenCubit _settingsCubit = GetIt.I.get<SettingsScreenCubit>();
  final StoreScreenCubit _storeScreenCubit = GetIt.I.get<StoreScreenCubit>();
  final TestListCubit _testListCubit = GetIt.I.get<TestListCubit>();
  final TestDownloadCubit _testDownloadCubit = GetIt.I.get<TestDownloadCubit>();

  final ExecuteScreenCubit _executeCubit = GetIt.I.get<ExecuteScreenCubit>();
  final BottomControlBarCubit _bottomControlBarCubit =
      GetIt.I.get<BottomControlBarCubit>();
  final PartListCubit _partListCubit = GetIt.I.get<PartListCubit>();
  //AppRouter._();

  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case store:
        return CupertinoPageRoute(
          // don't use MultiBlocProvider here because we don't want cubit release
          builder: (_) => BlocProvider.value(
            value: _storeScreenCubit..getInitContent(),
            child: BlocProvider.value(
              value: _bookListCubit,
              child: StoreScreen(),
            ),
          ),
        );
      case home:
        return CupertinoPageRoute(
          builder: (_) => BlocProvider.value(
            value: _bookListCubit,
            child: BlocProvider.value(
              value: _settingsCubit,
              child: BlocProvider.value(
                value: _favoriteScreenCubit,
                child: const HomeScreen(),
              ),
            ),
          ),
        );
      case test:
        final args = settings.arguments as ScreenArguments;
        final bookInfoModel = args.otherInfo as BookModel;
        return CupertinoPageRoute(
          builder: (_) => BlocProvider.value(
            value: _testListCubit..getInitContent(bookInfoModel.testIds),
            child: TestScreen(bookTitle: args.title),
          ),
        );
      case part:
        final args = settings.arguments as ScreenArguments;
        if (logEnable) {
          log('$_logTag part: args.childIds: ${args.childIds}');
        }
        return CupertinoPageRoute(
          builder: (_) => BlocProvider.value(
            value: _partListCubit
              ..getInitContent(
                  partIds: args.childIds,
                  testId: args.id,
                  testListCubit: _testListCubit),
            child: PartScreen(testTitle: args.title),
          ),
        );
      case executeTest:
        final args = settings.arguments as ScreenArguments;
        if (logEnable) {
          log('$_logTag execute: args.childIds: ${args.childIds}');
        }
        return CupertinoPageRoute(
          builder: (_) => BlocProvider.value(
            value: _partListCubit,
            child: BlocProvider.value(
              value: _executeCubit
                ..getInitContent(args.childIds,
                    bottomControlBarCubit: _bottomControlBarCubit),
              child: BlocProvider.value(
                value: _bottomControlBarCubit,
                child: ExecuteScreen(appBarTitle: args.title, isFullTest: true),
              ),
            ),
          ),
        );
      case practice:
        final args = settings.arguments as ScreenArguments;
        if (logEnable) {
          log('$_logTag practice: args.childIds: ${args.childIds}');
        }
        return CupertinoPageRoute(
          builder: (_) => BlocProvider.value(
            value: _executeCubit
              ..getInitContent(args.childIds,
                  bottomControlBarCubit: _bottomControlBarCubit),
            child: BlocProvider.value(
              value: _bottomControlBarCubit,
              child: ExecuteScreen(appBarTitle: args.title),
            ),
          ),
        );
      case testReview:
        final args = settings.arguments as ScreenArguments;
        return CupertinoPageRoute(
          builder: (_) => BlocProvider.value(
            value: _executeCubit
              ..getInitContent(args.childIds,
                  isReviewSession: true,
                  bottomControlBarCubit: _bottomControlBarCubit),
            child: BlocProvider.value(
              value: _bottomControlBarCubit,
              child: ExecuteScreen(appBarTitle: args.title),
            ),
          ),
        );
      default:
        throw const RouteException('Route not found!');
    }
  }
}
