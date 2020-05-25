import 'package:bhawik/utilities/route_names.dart';
import 'package:bhawik/locator.dart';
import 'package:bhawik/services/authentication_service.dart';
import 'package:bhawik/services/navigation_service.dart';
import 'package:bhawik/viewmodels/base_model.dart';

class StartUpViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future handleStartUpLogic() async {
    var hasLoggedInUser = await _authenticationService.isUserLoggedIn();

    if (hasLoggedInUser) {
      _navigationService.navigateTo(HomeViewRoute);
    } else {
      _navigationService.navigateTo(LoginViewRoute);
    }
  }
}
