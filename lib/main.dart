import 'package:flutter/material.dart';
import 'package:flutter_toeic_quiz2/core/constants/strings.dart';
import 'package:flutter_toeic_quiz2/core/themes/app_theme.dart';
import 'package:flutter_toeic_quiz2/presentation/router/app_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appTitle,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouter.home,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
