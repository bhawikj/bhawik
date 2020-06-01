import 'package:flutter/material.dart';

class Update extends StatelessWidget {
  final String title;
  Update(this.title);
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
