import 'package:bhawik/locator.dart';
import 'package:bhawik/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:bhawik/services/firestore_service.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirestoreService _firestoreService = locator<FirestoreService>();

  User _currentUser;
  User get currentUser => _currentUser;

  Future loginWithEmail({
    @required String email,
    @required String password,
  }) async {
    try {
      FirebaseUser user = (await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user;
      debugPrint(user.email);
      populateCurrentUser();

      return user != null;
    } catch (e) {
      return e.message;
    }
  }

  Future signUpWithEmail(
      {@required String email,
      @required String password,
      @required String fullName,
      @required List<String> prefs}) async {
    try {
      var authResult = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // create a new user profile on firestore
      _currentUser = User(
          id: authResult.user.uid,
          email: email,
          fullName: fullName,
          prefs: prefs);

      _firestoreService.createUser(_currentUser);
      debugPrint(authResult.user.uid);
      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }

  Future<bool> isUserLoggedIn() async {
    var user = await _firebaseAuth.currentUser();
    populateCurrentUser();
    return user != null;
  }

  Future<String> populateCurrentUser() async {
    var user = await _firebaseAuth.currentUser();
    debugPrint(user.uid + "_____");
    if (user != null) {
      _currentUser = await _firestoreService.getUser(user.uid);
      debugPrint(_currentUser.getId);
    }
    return user.uid;
  }
}

Future<User> getUser() async {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirestoreService _firestoreService = locator<FirestoreService>();
  var user = await _firebaseAuth.currentUser();
  User _currentUser =
      await _firestoreService.getUser(user.uid).whenComplete(() {
    print("complete");
  });
  return _currentUser;
}
