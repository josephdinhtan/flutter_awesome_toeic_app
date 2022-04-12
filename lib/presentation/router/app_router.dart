import 'package:flutter/material.dart';
import 'package:flutter_toeic_quiz2/core/exceptions/route_exception.dart';
import 'package:flutter_toeic_quiz2/presentation/screens/home_screen/home_screen.dart';
import 'package:flutter_toeic_quiz2/presentation/router/screen_arguments.dart';
import 'package:flutter_toeic_quiz2/presentation/screens/part_screen/part_screen.dart';
import 'package:flutter_toeic_quiz2/presentation/screens/test_screen/test_screen.dart';

class AppRouter {
  static const String home = '/';
  static const String test = '/test';
  static const String part = '/pass';

  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case test:
        final args = settings.arguments as ScreenArguments;
        return MaterialPageRoute(
          builder: (_) => TestScreen(bookId: args.id, bookTitle: args.title),
        );
      case part:
        final args = settings.arguments as ScreenArguments;
        return MaterialPageRoute(builder: (_) => PartScreen(testId: args.id, testTitle: args.title));
      default:
        throw const RouteException('Route not found!');
    }
  }
}
