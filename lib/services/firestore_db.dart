import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../models/models.dart';

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

  //UPLOAD DEFAULT AVATAR TO DB
  Future<String> uploadAvatar(File image, String uid) async {
    var imageFile =
        FirebaseStorage.instance.ref().child("avatars").child("/$uid");
    UploadTask task = imageFile.putFile(image);
    TaskSnapshot snapshot = await task;
    String url = await snapshot.ref.getDownloadURL();
    return url;
  }

  //UPLOAD CREATED HOUSE CODE DATA TO DB
  Future<void> uploadEstablishmentData(
    Map<String, dynamic> data,
    Map<String, dynamic> houseCode,
  ) async {
    await FirebaseFirestore.instance
        .collection("House Code Details")
        .doc(houseCode["houseCode"])
        .set(data);

    await FirebaseFirestore.instance
        .collection("House Codes")
        .doc(houseCode["houseCode"])
        .set(houseCode);
  }

  //UPLOAD ESTABLISHMENT PHOTOS TO STORAGE
  //RETURN LIST OF IMAGE URLS.
  Future<List<String>> uploadEstablishmentPhotos(
    List<File?> images,
    String houseCode,
  ) async {
    List<String> urls = [];
    for (int i = 0; i <= 3; i++) {
      var imageFile = FirebaseStorage.instance
          .ref()
          .child("establishment")
          .child(houseCode)
          .child("/image$i");
      UploadTask task = imageFile.putFile(images[i]!);
      TaskSnapshot snapshot = await task;
      String url = await snapshot.ref.getDownloadURL();
      urls.add(url);
    }
    return urls;
  }

  //GET USER DATA TO UPDATE ROLE DATA
  Future<AbangUser> getUserDataToUpdateRole(String uid) async {
    return AbangUser.fromMap(
      await FirebaseFirestore.instance.collection("User").doc(uid).get().then(
        (value) {
          return value.data()!;
        },
      ),
    );
  }

  //UPDATE USER ROLE
  Future<void> updateUserRole(Map<String, dynamic> userData, String uid) async {
    await FirebaseFirestore.instance
        .collection("User")
        .doc(uid)
        .update(userData);
  }

  //CHECK IF HOUSE CODE EXISTS
  Future<String> checkUserRoleIfExists(String houseCode) async {
    return await FirebaseFirestore.instance
        .collection("House Codes")
        .doc(houseCode)
        .get()
        .then((value) {
      if (value.exists) {
        return value.get(FieldPath(const ['landlordID']));
      } else {
        return "";
      }
    });
  }

  //CREATE TENANTS
  Future<void> createATenantData(Map<String, dynamic> data) async {
    await FirebaseFirestore.instance.collection("Tenants").doc().set(data);
  }
}
