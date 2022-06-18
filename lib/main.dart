import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'core_ui/constants/app_strings.dart';
import 'core_ui/themes/app_dark_theme.dart';
import 'core_ui/themes/app_light_theme.dart';
import 'core_utils/core_utils.dart';
import 'data/data_providers/hive_objects/book_hive_object/book_hive_object.dart';
import 'data/data_providers/hive_objects/part_execute_hive_object/part_four_hive_object.dart';
import 'data/data_providers/hive_objects/part_execute_hive_object/part_one_hive_object.dart';
import 'data/data_providers/hive_objects/part_execute_hive_object/part_three_hive_object.dart';
import 'data/data_providers/hive_objects/part_execute_hive_object/part_two_hive_object.dart';
import 'data/data_providers/hive_objects/part_hive_object/part_hive_object.dart';
import 'data/data_providers/hive_objects/test_hive_object/test_hive_object.dart';
import 'data/di/injection.dart';
import 'firebase_options.dart';
import 'presentation/router/app_router.dart';
import 'view_model/home_screen_cubit/home_screen_cubit.dart';

void main() async {
  if (kIsWeb) {
    await globalInitializerForWeb();
  } else {
    await globalInitializerForMobile();
  }
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _appRouter = getIt.get<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeScreenCubit>(
      create: (context) => getIt.get<HomeScreenCubit>()
        ..changeTheme(ThemeMode.light), // need change follow data base
      child: BlocBuilder<HomeScreenCubit, HomeScreenState>(
        builder: (context, state) {
          return MaterialApp(
            title: AppStrings.appTitle,
            theme: AppLightTheme.themeData,
            darkTheme: AppDarkTheme.themeData,
            debugShowCheckedModeBanner: false,
            themeMode: state is HomeScreenThemeModeChange
                ? state.themeMode
                : ThemeMode.light,
            initialRoute: AppRouter.home,
            onGenerateRoute: _appRouter.onGenerateRoute,
          );
        },
      ),
    );
  }
}

Future<void> globalInitializerForWeb() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

Future<void> globalInitializerForMobile() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  setApplicationDirectory(dir.path);
  Hive.init(dir.path);
  Hive.registerAdapter(BookHiveObjectAdapter());
  Hive.registerAdapter(TestHiveObjectAdapter());
  Hive.registerAdapter(PartHiveObjectAdapter());
  Hive.registerAdapter(PartOneHiveObjectAdapter());
  Hive.registerAdapter(PartTwoHiveObjectAdapter());
  Hive.registerAdapter(PartThreeHiveObjectAdapter());
  Hive.registerAdapter(PartFourHiveObjectAdapter());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
