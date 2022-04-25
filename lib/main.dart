import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_toeic_quiz2/core/constants/app_strings.dart';
import 'package:flutter_toeic_quiz2/core/themes/app_dark_theme.dart';
import 'package:flutter_toeic_quiz2/core/themes/app_light_theme.dart';
import 'package:flutter_toeic_quiz2/core/themes/app_light_theme_neumorphic.dart';
import 'package:flutter_toeic_quiz2/presentation/router/app_router.dart';
import 'package:flutter_toeic_quiz2/presentation/screens/test_screen/test_screen.dart';
import 'package:flutter_toeic_quiz2/view_model/home_screen_cubit/home_screen_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/themes/app_dark_theme_neumorphic.dart';
import 'presentation/screens/execute_screen/part_six_screen/part_six_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeScreenCubit>(
      create: (context) =>
      HomeScreenCubit()
        ..changeTheme(ThemeMode.system),// need change follow data base
      child: BlocBuilder<HomeScreenCubit, HomeScreenState>(
        builder: (context, state) {
          return NeumorphicApp(
            themeMode: (state as HomeScreenThemeModeChange).themeMode,
            theme: AppLightThemeNeumorphic.themeData,
            darkTheme: AppDarkThemeNeumorphic.themeData,
            home: MaterialApp(
              title: AppStrings.appTitle,
              theme: AppLightTheme.themeData,
              darkTheme: AppDarkTheme.themeData,
              debugShowCheckedModeBanner: false,
              themeMode: (state).themeMode,
              //initialRoute: AppRouter.home,
              initialRoute: '/test',
              routes: {
                // need remove in production version
                '/test': (context) =>
                PartSixScreen(partId: 1, partTitle: 'title'),
                //TestScreen(bookId: 1, bookTitle: 'demo title'),
              },
              onGenerateRoute: AppRouter.onGenerateRoute,
            ),
          );
        },
      ),
    );
  }
}
