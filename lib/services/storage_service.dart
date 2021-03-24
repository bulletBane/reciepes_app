import 'dart:io';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadPhoto(File photo) async {
    final String fileName = basename(photo.path);
    final storageRef = _storage.ref().child('recipes/gallery/photos/$fileName');
    UploadTask uploadTask = storageRef.putFile(photo);
    String uri =
        await uploadTask.then((snapshot) => snapshot.ref.getDownloadURL());
    return uri;
  }
}
