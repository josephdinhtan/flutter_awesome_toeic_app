import 'package:flutter/material.dart';
import 'package:flutter_toeic_quiz2/core/exceptions/route_exception.dart';
import 'package:flutter_toeic_quiz2/presentation/screens/home_screen/home_screen.dart';
import 'package:flutter_toeic_quiz2/presentation/screens/screen_arguments.dart';
import 'package:flutter_toeic_quiz2/presentation/screens/test_screen/test_screen.dart';

class AppRouter {
  static const String testing = '/testing';
  static const String home = '/';

  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
        );
      case testing:
        final args = settings.arguments as ScreenArguments;
        return MaterialPageRoute(
          builder: (_) => TestScreen(bookId: args.id, bookTitle: args.title),
        );
      default:
        throw const RouteException('Route not found!');
    }
  }
}
