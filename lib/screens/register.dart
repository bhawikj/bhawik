import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(register());

class register extends StatefulWidget {
  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Container(
          decoration: BoxDecoration(
          gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.1, 0.4, 0.7, 0.9],
          colors: [
          Color(0xFF3594DD),
          Color(0xFF4563DB),
          Color(0xFF5036D5),
          Color(0xFF5B16D0),
          ],
         ),
        ),
       ),
      ),
    );
  }
}