import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_toeic_quiz2/core_utils/global_configuration.dart';
import '../../core_ui/exceptions/route_exception.dart';
import '../../data/business_models/book_model.dart';
import '../screens/execute_screen/part_one_screen/part_one_screen.dart';
import '../screens/execute_screen/part_seven_screen/part_seven_screen.dart'
    show PartSevenScreen;
import '../screens/execute_screen/part_three_screen/part_three_screen.dart';
import '../screens/execute_screen/part_two_screen/part_two_screen.dart';
import '../screens/home_screen/home_screen.dart';
import 'screen_arguments.dart';
import '../screens/home_screen/store_screen/store_screen.dart';
import '../screens/part_screen/part_screen.dart';
import '../screens/test_screen/test_screen.dart';
import '../../view_model/book_screen_cubit/book_list_cubit.dart';
import '../../view_model/store_screen_cubit/store_screen_cubit.dart';

import '../../view_model/execute_screen_cubit/part_five_cubit/part_five_cubit.dart';
import '../../view_model/execute_screen_cubit/part_four_cubit/part_four_cubit.dart';
import '../../view_model/execute_screen_cubit/part_one_cubit/part_one_cubit.dart';
import '../../view_model/execute_screen_cubit/part_seven_cubit/part_seven_cubit.dart';
import '../../view_model/execute_screen_cubit/part_six_cubit/part_six_cubit.dart';
import '../../view_model/execute_screen_cubit/part_three_cubit/part_three_cubit.dart';
import '../../view_model/execute_screen_cubit/part_two_cubit/part_two_cubit.dart';
import '../../view_model/part_screen_cubit/part_list_cubit.dart';
import '../../view_model/test_screen_cubit/test_download_cubit.dart';
import '../../view_model/test_screen_cubit/test_list_cubit.dart';
import '../screens/execute_screen/part_five_screen/part_five_screen.dart';
import '../screens/execute_screen/part_four_screen/part_four_screen.dart';
import '../screens/execute_screen/part_six_screen/part_six_screen.dart';

const _logTag = "AppRouter";

class AppRouter {
  static const String home = '/';
  static const String test = '/tests';
  static const String store = '/store';
  static const String part = '/parts';
  static const String part1Exam = '/part1exam';
  static const String part2Exam = '/part2exam';
  static const String part3Exam = '/part3exam';
  static const String part4Exam = '/part4exam';
  static const String part5Exam = '/part5exam';
  static const String part6Exam = '/part6exam';
  static const String part7Exam = '/part7exam';

  final BookListCubit _bookListCubit = BookListCubit();
  final StoreScreenCubit _storeScreenCubit = StoreScreenCubit();
  final TestListCubit _testListCubit = TestListCubit();
  final TestDownloadCubit _testDownloadCubit = TestDownloadCubit();

  final PartListCubit _partListCubit = PartListCubit();
  final PartOneCubit _partOneCubit = PartOneCubit();
  final PartTwoCubit _partTwoCubit = PartTwoCubit();
  final PartThreeCubit _partThreeCubit = PartThreeCubit();
  final PartFourCubit _partFourCubit = PartFourCubit();
  final PartFiveCubit _partFiveCubit = PartFiveCubit();
  final PartSixCubit _partSixCubit = PartSixCubit();
  final PartSevenCubit _partSevenCubit = PartSevenCubit();

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
            child: const HomeScreen(),
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
        if (LogEnable) {
          log('$_logTag part: args.childIds: ${args.childIds}');
        }
        return CupertinoPageRoute(
          builder: (_) => BlocProvider.value(
            value: _partListCubit..getInitContent(args.childIds),
            child: PartScreen(testTitle: args.title),
          ),
        );
      case part1Exam:
      case part2Exam:
      case part3Exam:
      case part4Exam:
      case part5Exam:
      case part6Exam:
      case part7Exam:
        return onGeneratePartRoute(settings);
      default:
        throw const RouteException('Route not found!');
    }
  }

  Route<dynamic> onGeneratePartRoute(RouteSettings settings) {
    switch (settings.name) {
      case part1Exam:
        final args = settings.arguments as ScreenArguments;
        return CupertinoPageRoute(
          builder: (_) => BlocProvider.value(
            value: _partOneCubit..getInitContent(args.childIds),
            child: PartOneScreen(partTitle: args.title),
          ),
        );
      case part2Exam:
        final args = settings.arguments as ScreenArguments;
        return CupertinoPageRoute(
          builder: (_) => BlocProvider.value(
            value: _partTwoCubit..getInitContent(args.childIds),
            child: PartTwoScreen(partTitle: args.title),
          ),
        );
      case part3Exam:
        final args = settings.arguments as ScreenArguments;
        return CupertinoPageRoute(
          builder: (_) => BlocProvider.value(
            value: _partThreeCubit..getInitContent(args.childIds),
            child: PartThreeScreen(partTitle: args.title),
          ),
        );
      case part4Exam:
        final args = settings.arguments as ScreenArguments;
        return CupertinoPageRoute(
          builder: (_) => BlocProvider.value(
            value: _partFourCubit..getInitContent(),
            child: PartFourScreen(partTitle: args.title),
          ),
        );
      case part5Exam:
        final args = settings.arguments as ScreenArguments;
        return CupertinoPageRoute(
          builder: (_) => BlocProvider.value(
            value: _partFiveCubit..getInitContent(),
            child: PartFiveScreen(partTitle: args.title),
          ),
        );
      case part6Exam:
        final args = settings.arguments as ScreenArguments;
        return CupertinoPageRoute(
          builder: (_) => BlocProvider.value(
            value: _partSixCubit..getInitContent(),
            child: PartSixScreen(partTitle: args.title),
          ),
        );
      case part7Exam:
        final args = settings.arguments as ScreenArguments;
        return CupertinoPageRoute(
          builder: (_) => BlocProvider.value(
            value: _partSevenCubit..getInitContent(),
            child: PartSevenScreen(partTitle: args.title),
          ),
        );
      default:
        throw const RouteException('Route not found!');
    }
  }
}
