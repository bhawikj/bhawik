import 'package:flutter/material.dart';

class About extends StatelessWidget {
  final String title;
  About(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(title, style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Color(0xFF4563DB)),
      ),
    );
  }
}
