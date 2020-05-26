import 'package:bhawik/locator.dart';
import 'package:bhawik/screens/start_up.dart';
import 'package:bhawik/services/dialog_service.dart';
import 'package:bhawik/services/navigation_service.dart';
import 'package:bhawik/utilities/router.dart';
import 'package:flutter/material.dart';
import 'managers/dialog_manager.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Onboarding UI',
      builder: (context, child) => Navigator(
        key: locator<DialogService>().dialogNavigationKey,
        onGenerateRoute: (settings) => MaterialPageRoute(
            builder: (context) => DialogManager(child: child)),
      ),
      navigatorKey: locator<NavigationService>().navigationKey,
      debugShowCheckedModeBanner: false,
      home: StartUpView(),
      onGenerateRoute: generateRoute,
    );
  }
}
