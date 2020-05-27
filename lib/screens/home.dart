import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:bhawik/screens/internships.dart';
import 'package:bhawik/screens/courses.dart';
import 'package:bhawik/screens/cv.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

int _page = 1;
final _pageoption = [
  CV(),
  Internships(),
  Courses(),
];

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageoption[_page],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color(0xFF5B16D0),
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        items: <Widget>[
          Icon(Icons.list, size: 30),
          Icon(Icons.home, size: 30),
          Icon(Icons.list, size: 30),
        ],
        height: 50,
        animationDuration: Duration(milliseconds: 150),
        animationCurve: Curves.bounceInOut,
        index: 1,
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
    );
  }
}
