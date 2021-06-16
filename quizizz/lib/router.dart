import 'package:flutter/material.dart';
import 'package:quizizz/global/data/route_names.dart';
import 'package:quizizz/home_page/presentation/pages/home_page.dart';
import 'package:quizizz/onboarding/pages/splash_screen.dart';
import 'package:quizizz/quiz_page/presentation/pages/quiz_page.dart';
import 'package:quizizz/quiz_page/presentation/pages/quiz_result_page.dart';
import 'package:transition/transition.dart';

class AppRouter {
  AppRouter._();
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.SPLASH_SCREEN:
        return MaterialPageRoute(
          builder: (context) => SplashScreen(),
        );
      case RouteNames.HOME_PAGE:
        return MaterialPageRoute(
          builder: (context) => HomePage(),
        );
      case RouteNames.QUIZ_PAGE:
        return Transition(
          child: QuizPage(),
          transitionEffect: TransitionEffect.SCALE,
        );
    }
  }
}
