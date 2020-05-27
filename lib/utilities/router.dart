import 'package:bhawik/screens/main/home.dart';
import 'package:flutter/material.dart';
import 'package:bhawik/utilities/route_names.dart';
import 'package:bhawik/screens/auth/login_screen.dart';
import 'package:bhawik/screens/auth/signup_screen.dart';
import 'package:bhawik/screens/auth/onboarding_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: LoginScreen(),
      );
    case SignUpViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: SignupScreen(),
      );
    case HomeViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: Home(),
      );
    case StartUpRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: OnboardingScreen(),
      );
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}

PageRoute _getPageRoute({String routeName, Widget viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow);
}
