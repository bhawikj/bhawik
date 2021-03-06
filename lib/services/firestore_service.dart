import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bhawik/models/user.dart';
import 'package:flutter/rendering.dart';

class FirestoreService {
  final CollectionReference _usersCollectionReference =
      Firestore.instance.collection('users');

  Future createUser(User user) async {
    try {
      await _usersCollectionReference.document(user.id).setData(user.toJson());
    } catch (e) {
      return e.message;
    }
  }

  Future getUser(String uid) async {
    try {
      var userData = await _usersCollectionReference.document(uid).get();
      print(userData.data);
      return User.fromData(userData.data);
    } catch (e) {
      print(e);
    }
  }

  Future updateUser(String uid, List<String> prefs) async {
    try {
      await _usersCollectionReference
          .document(uid)
          .updateData({'prefs': prefs}).catchError((e) {
        debugPrint(e.toString());
      });
      // return User.fromData(userData.data);
    } catch (e) {
      return e.message;
    }
  }
}
