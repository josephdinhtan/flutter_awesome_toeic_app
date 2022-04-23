import 'package:flutter/material.dart';
import 'package:flutter_toeic_quiz2/core/constants/app_strings.dart';
import 'package:flutter_toeic_quiz2/core/themes/app_dark_theme.dart';
import 'package:flutter_toeic_quiz2/core/themes/app_light_theme.dart';
import 'package:flutter_toeic_quiz2/presentation/router/app_router.dart';
import 'presentation/screens/execute_screen/part_six_screen/part_six_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      theme: AppLightTheme.themeData,
      darkTheme: AppDarkTheme.themeData,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      //initialRoute: AppRouter.home,
      initialRoute: '/test',
      routes: {
        // need remove in production version
        '/test': (context) =>
            const PartSixScreen(partId: 1, partTitle: 'demo title'),
      },
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
