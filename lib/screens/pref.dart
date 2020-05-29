//import 'dart:js';

import 'package:bhawik/screens/main/home.dart';
import 'package:bhawik/screens/pref_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bhawik/viewmodels/signup_view_model.dart';

import 'package:bhawik/screens/auth/signup_screen.dart';

class PrefForm extends StatefulWidget {
  @override
  _PrefFormState createState() => _PrefFormState();
}

class _PrefFormState extends State<PrefForm> {
  List prefs = [
    "Add your 1st preference.",
    "Add your 2nd preference.",
    "Add your 3rd preference."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Select Field of Internships',
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
                  child : _selector(context),
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
                        letterSpacing: 1.5, fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OpenSans',
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(context,
                        MaterialPageRoute(builder: (context) => Home()),
                            (Route<dynamic> route) => false,);
                      },
                  ),
                ),
              ],
          ),
        )
      )
    );
  }

  Widget _selector(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Card(
            color: Color(0xFF4563DB),
            child: ListTile(
              title: Text(prefs[index], style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,), textAlign: TextAlign.center,),
              onTap: () async {
                var result = await Navigator.push(
                    context,
                    MaterialPageRoute<String>(
                        builder: (BuildContext context) => PrefList()));
                setState(() {
                  if (result != "") {
                    prefs[index] = result;
                  }
                });
              },
            ),
          );
        }
        );
  }
}
