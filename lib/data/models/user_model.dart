import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String uid;
  String name;
  String email;
  UserModel({this.uid, this.email, this.name});

  factory UserModel.fromDoc(DocumentSnapshot snapshot) => UserModel(
      uid: snapshot['uid'], name: snapshot['name'], email: snapshot['email']);
}
