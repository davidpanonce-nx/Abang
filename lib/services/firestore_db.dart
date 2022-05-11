import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

mixin FirestoreDataServices {
  //UPLOAD SIGNATURE DATA TO STORAGE
  //RETURN THE IMAGE URL
  Future<String> uploadSignatureImage(
    Uint8List signatureData,
    String uid,
  ) async {
    var imageFile =
        FirebaseStorage.instance.ref().child("signatures").child("/$uid.png");
    UploadTask task = imageFile.putData(signatureData);
    TaskSnapshot snapshot = await task;
    String url = await snapshot.ref.getDownloadURL();
    return url;
  }

  //UPLOAD NEW USER DATA TO DB

  Future<void> uploadUserDataToDB(
    Map<String, dynamic> data,
  ) async {
    await FirebaseFirestore.instance
        .collection("User")
        .doc(data["userID"])
        .set(data);
  }
}
