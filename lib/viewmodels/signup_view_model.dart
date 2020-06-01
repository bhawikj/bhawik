import 'package:bhawik/locator.dart';
import 'package:bhawik/services/authentication_service.dart';
import 'package:bhawik/services/dialog_service.dart';
// import 'package:bhawik/services/navigation_service.dart';
import 'package:flutter/foundation.dart';

import 'base_model.dart';

class SignUpViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final DialogService _dialogService = locator<DialogService>();
  // final NavigationService _navigationService = locator<NavigationService>();

  String _selectedRole = 'Select a User Role';
  String get selectedRole => _selectedRole;

  void setSelectedRole(dynamic role) {
    _selectedRole = role;
    notifyListeners();
  }

  Future signUp(
      {@required String email,
      @required String password,
      @required String fullName,
      @required List<String> prefs}) async {
    setBusy(true);

    var result = await _authenticationService.signUpWithEmail(
      email: email,
      password: password,
      fullName: fullName,
      prefs: prefs,
    );
    setBusy(false);
    debugPrint(result);
    if (result is bool) {
      if (result) {
        // _navigationService.navigateTo(PrefViewRoute);

      } else {
        await _dialogService.showDialog(
          title: 'Sign Up Failure',
          description: 'General sign up failure. Please try again later',
        );
      }
    } else {
      await _dialogService.showDialog(
        title: 'Sign Up Failure',
        description: result,
      );
    }
  }
}
