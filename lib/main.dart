import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_toeic_quiz2/core/constants/app_strings.dart';
import 'package:flutter_toeic_quiz2/core/themes/app_dark_theme.dart';
import 'package:flutter_toeic_quiz2/core/themes/app_light_theme.dart';
import 'package:flutter_toeic_quiz2/core/themes/app_light_theme_neumorphic.dart';
import 'package:flutter_toeic_quiz2/presentation/router/app_router.dart';
import 'package:flutter_toeic_quiz2/presentation/screens/execute_screen/part_three_screen/part_three_screen.dart';
import 'package:flutter_toeic_quiz2/presentation/screens/part_screen/part_screen.dart';
import 'package:flutter_toeic_quiz2/presentation/screens/test_screen/test_screen.dart';
import 'package:flutter_toeic_quiz2/view_model/home_screen_cubit/home_screen_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/themes/app_dark_theme_neumorphic.dart';
import 'presentation/screens/execute_screen/part_six_screen/part_six_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeScreenCubit>(
      create: (context) =>
      HomeScreenCubit()
        ..changeTheme(ThemeMode.light),// need change follow data base
      child: BlocBuilder<HomeScreenCubit, HomeScreenState>(
        builder: (context, state) {
          return MaterialApp(
              title: AppStrings.appTitle,
              theme: AppLightTheme.themeData,
              darkTheme: AppDarkTheme.themeData,
              debugShowCheckedModeBanner: false,
              themeMode: state is HomeScreenThemeModeChange ? state.themeMode : ThemeMode.light,
              //initialRoute: AppRouter.home,
              initialRoute: '/test',
              routes: {
                // need remove in production version
                '/test': (context) =>
                //PartScreen(testId: 1, testTitle: 'title'),
                //TestScreen(bookId: 1, bookTitle: 'demo title'),
                TestScreen(bookId: 1, bookTitle: 'partTitle'),
              },
              onGenerateRoute: AppRouter.onGenerateRoute,
          );
        },
      ),
    );
  }
}
