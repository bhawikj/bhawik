import 'package:bhawik/services/authentication_service.dart';
import 'package:bhawik/services/firestore_service.dart';
import 'package:get_it/get_it.dart';
import 'package:bhawik/services/navigation_service.dart';
import 'package:bhawik/services/dialog_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => FirestoreService());
}
