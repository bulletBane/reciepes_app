import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/user_model.dart';

class UserDB {
  final FirebaseFirestore _store = FirebaseFirestore.instance;

  Future<bool> createNewUser(UserModel user) async {
    try {
      await _store
          .collection('users')
          .doc(user.uid)
          .set({'name': user.name, 'email': user.email, 'uid': user.uid});
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<UserModel> getUser(String uid) async {
    try {
      DocumentSnapshot snapshot =
          await _store.collection('users').doc(uid).get();
      return UserModel.fromDoc(snapshot);
    } catch (e) {
      debugPrint(e);
      rethrow;
    }
  }
}
