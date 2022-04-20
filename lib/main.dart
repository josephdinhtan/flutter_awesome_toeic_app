import 'package:flutter/material.dart';
import 'package:flutter_toeic_quiz2/core/constants/app_strings.dart';
import 'package:flutter_toeic_quiz2/core/themes/app_dark_theme.dart';
import 'package:flutter_toeic_quiz2/core/themes/app_light_theme.dart';
import 'package:flutter_toeic_quiz2/presentation/router/app_router.dart';
import 'package:flutter_toeic_quiz2/presentation/screens/execute_screen/part_three_screen/part_three_screen.dart';

import 'presentation/screens/execute_screen/part_one_screen/part_one_screen.dart';

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
      //initialRoute: AppRouter.home,
      initialRoute: '/test',
      routes: {
        // need remove in production version
        '/test': (context) =>
            PartThreeScreen(partId: 1, partTitle: 'demo title'),
      },
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
