import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class Auth {
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> signIN(
      {@required String email, @required String password}) async {
    try {
      auth.createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {}
  }
}
