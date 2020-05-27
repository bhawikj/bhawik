import 'package:bhawik/locator.dart';
import 'package:bhawik/screens/home.dart';
import 'package:bhawik/screens/onboarding_screen.dart';
// import 'package:bhawik/screens/start_up.dart';
import 'package:bhawik/services/dialog_service.dart';
import 'package:bhawik/services/navigation_service.dart';
import 'package:bhawik/utilities/router.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
      home: FutureBuilder(
        // get the Provider, and call the getUser method
        future: FirebaseAuth.instance.currentUser(),
        // wait for the future to resolve and render the appropriate
        // widget for HomePage or LoginPage
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Home();
          } else {
            return OnboardingScreen();
          }
        },
      ),
      onGenerateRoute: generateRoute,
    );
  }
}
