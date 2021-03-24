import 'package:cloud_firestore/cloud_firestore.dart';

class Recipe {
  String uid;
  String title;
  String description;
  String photoPath;
  String authorName;
  String authorImagePath;
  List<String> galery;
  List<Map<String, dynamic>> ingridients;
  List<String> howToCook;
  Timestamp createdTime;
  int likes;
  int comments;
  int ingredientsNumber;

  Recipe({
    this.uid,
    this.galery,
    this.ingridients,
    this.howToCook,
    this.title,
    this.description,
    this.photoPath,
    this.authorName,
    this.authorImagePath,
    this.createdTime,
    this.likes,
    this.comments,
    this.ingredientsNumber,
  });

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'photoPath': photoPath,
        'authorName': authorName,
        'authorImagePath': authorImagePath,
        'createdTime': createdTime,
        'likes': likes,
        'galery': galery,
        'howToCook': howToCook,
        'ingridients': ingridients,
        'comments': comments,
        'ingredientsNumber': ingredientsNumber,
      };

  factory Recipe.fromDoc(
    DocumentSnapshot doc,
  ) =>
      Recipe(
        uid: doc['uid'],
        title: doc['title'],
        description: doc['description'],
        photoPath: doc['photoPath'],
        authorName: doc['authorName'],
        authorImagePath: doc['authorImagePath'],
        createdTime: doc['createdTime'],
        galery: doc['galery'],
        ingridients: doc['ingridients'],
        howToCook: doc['howToCook'],
        likes: doc['likes'],
        comments: doc['comments'],
        ingredientsNumber: doc['ingredientsNumber'],
      );
}
