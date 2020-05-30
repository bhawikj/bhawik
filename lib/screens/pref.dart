//import 'dart:js';
import 'package:bhawik/locator.dart';
import 'package:bhawik/models/user.dart';
import 'package:bhawik/screens/main/home.dart';
import 'package:bhawik/screens/pref_list.dart';
import 'package:bhawik/services/firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bhawik/viewmodels/signup_view_model.dart';
import 'package:bhawik/screens/auth/signup_screen.dart';
import 'package:bhawik/services/authentication_service.dart';

class PrefForm extends StatefulWidget {
  final User currentUser;

  const PrefForm({Key key, this.currentUser}) : super(key: key);

  @override
  _PrefFormState createState() => _PrefFormState(currentUser);
}

class _PrefFormState extends State<PrefForm> {
  // final AuthenticationService _authService = locator<AuthenticationService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();
  // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final User _currentUser;
  String _uid;
  List<String> prefs = [
    "Add your preference.",
  ];

  _PrefFormState(this._currentUser);

  @override
  void initState() {
    _getUser();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light,
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Select Field of Internships',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'OpenSans',
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Container(
                    height: 280,
                    decoration: BoxDecoration(),
                    child: _selector(context),
                  ),
                  SizedBox(height: 0.0),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 25.0),
                    width: 160,
                    child: RaisedButton(
                      elevation: 5.0,
                      padding: EdgeInsets.all(15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      color: Color(0xFF4563DB),
                      child: Text(
                        'SIGN UP',
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1.5,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans',
                        ),
                      ),
                      onPressed: () {
                        // var _uid = _authService.currentUser.id;
                        _firestoreService.updateUser(_uid, prefs);
                        debugPrint(_uid + "____*_");
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                          (Route<dynamic> route) => false,
                        );
                      },
                    ),
                  ),
                ],
              ),
            )));
  }

  Widget _selector(BuildContext context) {
    return ListView.builder(
        itemCount: prefs.length <= 3 ? prefs.length : 3,
        itemBuilder: (context, index) {
          return Card(
            color: Color(0xFF4563DB),
            child: ListTile(
              leading: Text(
                "${index + 1}",
                style: TextStyle(color: Colors.white),
              ),
              title: Text(
                prefs[index],
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              trailing: Icon(
                Icons.close,
                color: Colors.white,
              ),
              onTap: () async {
                var result = await Navigator.push(
                    context,
                    MaterialPageRoute<String>(
                        builder: (BuildContext context) => PrefList(
                              prefs: prefs,
                            )));
                setState(() {
                  if (result != "") {
                    prefs[index] = result;
                    if (prefs.length < 3) {
                      prefs.add("Add your preference.");
                      print("******");
                    }
                  }
                });
              },
            ),
          );
        });
  }

  Future _getUser() async {
    // var user = await _firebaseAuth.currentUser();
    // _uid = user.uid;
    // _currentUser = await _firestoreService.getUser(_uid);

    // var id = await _authService.populateCurrentUser();
    // debugPrint("*******$id");
    _uid = _currentUser.getId;
    prefs = _currentUser.prefs;
    print(prefs);
    print(_uid);
    if (prefs.length < 3) {
      prefs.add("Add your preference.");
      print("******");
    }
  }
}
