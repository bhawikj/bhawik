import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';


void main() => runApp(Courses());

class Courses extends StatefulWidget {

  final String image;
  final String textTop;
  final String textBottom;
  final double offset;
  const Courses(
      {Key key, this.image, this.textTop, this.textBottom, this.offset})
      : super(key: key);

  @override
  _CoursesState createState() => _CoursesState();
}


class _CoursesState extends State<Courses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
            child: ClipPath(
              clipper: MyClipper(),
              child: Container(
                padding: EdgeInsets.only(left: 40, top: 50, right: 20),
                height: 350,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xFF3383CD),
                      Color(0xFF11249F),
                    ],
                  ),
                  image: DecorationImage(
                    image: AssetImage("assets/images/onboarding0.png"),
                  ),
                ),
              ),
            ),
      ),
    );
//          child: Stack(
//            children: <Widget>[
//              Container(
//                height: double.infinity,
//                width: double.infinity,
//                decoration: BoxDecoration(
//                  gradient: LinearGradient(
//                    begin: Alignment.topCenter,
//                    end: Alignment.bottomCenter,
//                    colors: [
//                      Color(0xFF3594DD),
//                      Color(0xFF4563DB),
//                      Color(0xFF5036D5),
//                      Color(0xFF5B16D0),
//                    ],
//                    stops: [0.1, 0.4, 0.7, 0.9],
//                  ),
//                ),
//              ),
//              Container(
//                height: double.infinity,
//                child: SingleChildScrollView(
//                    physics: AlwaysScrollableScrollPhysics(),
//                    padding: EdgeInsets.symmetric(
//                      horizontal: 40.0,
//                      vertical: 90.0,
//                    ),
//                    child:
//                    Column(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: <Widget>[
//                        Text(
//                          'COURSES',
//                          style: TextStyle(
//                            color: Colors.white,
//                            fontFamily: 'OpenSans',
//                            fontSize: 30.0,
//                            fontWeight: FontWeight.bold,
//                          ),
//                        ),
//                      ],
//                    )
//                ),
//              )
//            ],
//          ),
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}