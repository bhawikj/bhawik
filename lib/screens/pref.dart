import 'package:bhawik/screens/pref_list.dart';
import 'package:flutter/material.dart';

class PrefForm extends StatefulWidget {
  @override
  _PrefFormState createState() => _PrefFormState();
}

class _PrefFormState extends State<PrefForm> {
  List prefs = [
    "Select your preference..",
    "Select your preference..",
    "Select your preference.."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Preferences"),
        leading: Icon(Icons.arrow_back),
      ),
      body: Container(
        decoration: BoxDecoration(),
        child: _selector(context),
      ),
    );
  }

  Widget _selector(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(prefs[index]),
            onTap: () {
              setState(() async {
                var result = await Navigator.push(
                    context,
                    MaterialPageRoute<String>(
                        builder: (BuildContext context) => PrefList()));
                if (result != "") {
                  prefs[index] = result;
                }
              });
            },
          );
        });
  }
}
