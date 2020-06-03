import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';


void main() => runApp(Internships());


class Internships extends StatefulWidget {
  Internships({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _InternshipsState createState() => _InternshipsState();
}

class _InternshipsState extends State<Internships> {
  Future<List<User>> _getUsers() async {
    var data = await http.get("https://next.json-generator.com/api/json/get/EkiNrT9id");
    var jsonData = json.decode(data.body);
    List<User> users = [];
    for(var u in jsonData){
      User user = User(u["index"], u["about"], u["name"], u["email"], u["picture"]);
      users.add(user);
    }
    print(users.length);
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      //FirstScreen(),
      Container(
        child: FutureBuilder(
          future: _getUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            print(snapshot.data);
            if(snapshot.data == null){
              return Container(
                  child: Center(
                      child: Text("Loading...")
                  )
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          snapshot.data[index].picture
                      ),
                    ),
                    title: Text(snapshot.data[index].name),
                    subtitle: Text(snapshot.data[index].email),
                    onTap: (){

                      Navigator.push(context,
                          new MaterialPageRoute(builder: (context) => DetailPage(snapshot.data[index]))
                      );
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final User user;
  DetailPage(this.user);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(user.name),
        )
    );
  }
}

class User {
  final int index;
  final String about;
  final String name;
  final String email;
  final String picture;
  User(this.index, this.about, this.name, this.email, this.picture);
}


//class FirstScreen extends StatelessWidget {
//  @override

//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: Colors.black,
//      body: AnnotatedRegion<SystemUiOverlayStyle>(
//        value: SystemUiOverlayStyle.light,
//        child: GestureDetector(
//          onTap: () => FocusScope.of(context).unfocus(),
//          child: Stack(
//            children: <Widget>[
//              Container(
//                color: Colors.white,
//                height: double.infinity,
//                child: SingleChildScrollView(
//                    physics: AlwaysScrollableScrollPhysics(),
//                    padding: EdgeInsets.symmetric(
//                      horizontal: 20.0,
//                      vertical: 20.0,
//                    ),
//                    child:
//                    Column(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: <Widget>[
//                        Text(
//                          'INTERNSHIPS..............',
//                          style: TextStyle(
//                            color: Colors.yellow,
//                            fontFamily: 'OpenSans',
//                            fontSize: 30.0,
//                            fontWeight: FontWeight.bold,
//                          ),
//                        ),
//                        SizedBox(height: 600),
//                        Text(
//                          'INTERNSHIPS',
//                          style: TextStyle(
//                            color: Colors.yellow,
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
//        ),
//      ),
//    );
//  }
//}