class User {
  final String id;
  final String fullName;
  final String email;
  final List<String> prefs;
  User({this.id, this.fullName, this.email, this.prefs});

  User.fromData(Map<String, dynamic> data)
      : id = data['id'],
        fullName = data['fullName'],
        email = data['email'],
        prefs = data['prefs'].cast<String>();
  Map<String, dynamic> toJson() {
    return {'id': id, 'fullName': fullName, 'email': email, 'prefs': prefs};
  }

  String get getId => id;
  List<String> get prefList => prefs;
  // set id(String iD){
  //   this.id=iD;
  // }
}
