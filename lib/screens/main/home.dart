import 'package:bhawik/screens/auth/login_screen.dart';
import 'package:bhawik/screens/main/About.dart';
import 'package:bhawik/screens/main/Contact.dart';
import 'package:bhawik/screens/main/Work.dart';
import 'package:bhawik/screens/main/update.dart';
import 'package:bhawik/services/authentication_service.dart';
// import 'package:bhawik/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:bhawik/models/user.dart' as userModel;
import 'package:bhawik/screens/main/internships.dart';
import 'package:bhawik/screens/main/courses.dart';
import 'package:bhawik/screens/main/cv.dart';
import 'package:bhawik/screens/pref.dart';

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
  // final AuthenticationService _authService = locator<AuthenticationService>();
  //final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  //final FirestoreService _firestoreService = locator<FirestoreService>();
  userModel.User _currentUser;

  int _prefbtnCount = 0;

  // String _uid;
  int _currentIndex = 1;
  @override
  void initState() {
    _initUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageoption[_currentIndex],
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        Update("Saved Internships")),
              );
              debugPrint("Pressed Saved Internships");
            },
            icon: Icon(Icons.favorite, color: Colors.red),
          ),
          IconButton(
            onPressed: () {
              _prefbtnCount = 1;
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PrefForm(
                          currentUser: _currentUser, prefbtnCount : _prefbtnCount)
                ),
              );
              _prefbtnCount = 0;
            },
            icon: Icon(Icons.filter_list, color: Color(0xFF4563DB)),
          )
        ],
        title: Text("Interncity", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: Color(0xFF4563DB)),
      ),
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedIconTheme: IconThemeData(size: 30, color: Color(0xFF4563DB)),
        selectedItemColor: Color(0xFF4563DB),
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedItemColor: Colors.black26,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), title: Text('CV Builder')),
          BottomNavigationBarItem(
              icon: Icon(Icons.trending_up), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), title: Text('Insights')),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  void _initUser() async {
    //var user = await _firebaseAuth.currentUser();
    // _uid = user.uid;
    _currentUser = await getUser().whenComplete(() {
      print("home innit");
    });
  }
}

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
              width: double.infinity,
              height: 200,
              color: Colors.grey.withAlpha(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/images/onboarding0.png",
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("BIntern"),
                ],
              )),
          ListTile(
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                new MaterialPageRoute(
                    builder: (BuildContext context) => About("About")),
              );
              debugPrint("Tapped About");
            },
            leading: Icon(Icons.person),
            title: Text(
              "About",
            ),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                new MaterialPageRoute(
                    builder: (BuildContext context) => Contact("Contact Us")),
              );
              debugPrint("Tapped Contact");
            },
            leading: Icon(Icons.phone),
            title: Text("Contact Us"),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                new MaterialPageRoute(
                    builder: (BuildContext context) => Work("Work With Us")),
              );
              debugPrint("Tapped Work");
            },
            leading: Icon(Icons.work),
            title: Text("Work with us"),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        Update("Update Password")),
              );
              debugPrint("Tapped Update Password");
            },
            leading: Icon(Icons.update),
            title: Text("Update Password"),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                new MaterialPageRoute(
                    builder: (BuildContext context) => LoginScreen()),
              );
              debugPrint("Tapped Log Out");
            },
            leading: Icon(Icons.exit_to_app),
            title: Text("Log Out"),
          ),
        ],
      ),
    );
  }
}
