import 'package:flutter/material.dart';

class Saved extends StatelessWidget {
  final String title;
  Saved(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: new Text(title, style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
    );
  }
}
