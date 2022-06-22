import 'package:abang/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DataStreams extends ChangeNotifier {
  DataStreams(this.houseCode);
  String? houseCode;

  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('User');

  final CollectionReference _houseCodeDetails =
      FirebaseFirestore.instance.collection('House Code Details');
  final CollectionReference _houseCodes =
      FirebaseFirestore.instance.collection('House Codes');

  String _userDataFromFirebase(DocumentSnapshot snapshot) {
    return snapshot.get(FieldPath(const ['role']));
  }

  //USER STREAM
  Stream<String> get userData {
    return _userCollection
        .doc(
          FirebaseAuth.instance.currentUser!.uid,
        )
        .snapshots()
        .map(_userDataFromFirebase);
  }

  //AVATAR PICTURE STREAM
  String _avatarPicStream(DocumentSnapshot snapshot) {
    return snapshot.get(FieldPath(const ['avatarURL']));
  }

  Stream<String> get avatarData {
    return _userCollection
        .doc(
          FirebaseAuth.instance.currentUser!.uid,
        )
        .snapshots()
        .map(_avatarPicStream);
  }

  //FIRST NAME STREAM
  String _firstNameStream(DocumentSnapshot snapshot) {
    return snapshot.get(FieldPath(const ['basicInformation']))['firstName'];
  }

  Stream<String> get firstNameData {
    return _userCollection
        .doc(
          FirebaseAuth.instance.currentUser!.uid,
        )
        .snapshots()
        .map(_firstNameStream);
  }

  // ESTABLISHMENT NAME STREAM
  String _establishmentName(DocumentSnapshot snapshot) {
    return snapshot.get(FieldPath(const ['estName']));
  }

  Stream<String> get estNameData {
    return _houseCodeDetails
        .doc(
          houseCode,
        )
        .snapshots()
        .map(_establishmentName);
  }

  //ABANG USER DATA STREAM
  AbangUser _abangUserDataFromFirebase(DocumentSnapshot snapshot) {
    return AbangUser(
      userID: snapshot.get(FieldPath(const ["userID"])),
      role: snapshot.get(FieldPath(const ["role"])),
      dateCreated: snapshot.get(FieldPath(const ["dateCreated"])),
      userInfoID:
          snapshot.get(FieldPath(const ["basicInformation"]))["userInfoID"],
      firstName:
          snapshot.get(FieldPath(const ["basicInformation"]))["firstName"],
      middleName:
          snapshot.get(FieldPath(const ["basicInformation"]))["middleName"],
      lastName: snapshot.get(FieldPath(const ["basicInformation"]))["lastName"],
      contactNumber:
          snapshot.get(FieldPath(const ["basicInformation"]))["contactNumber"],
      avatarURL: snapshot.get(FieldPath(const ["avatarURL"])),
      signatureURL: snapshot.get(FieldPath(const ["signatureURL"])),
      email: snapshot.get(FieldPath(const ["basicInformation"]))["email"],
      locationID: snapshot.get(FieldPath(const ["location"]))["locationID"],
      region: snapshot.get(FieldPath(const ["location"]))["region"],
      province: snapshot.get(FieldPath(const ["location"]))["province"],
      city: snapshot.get(FieldPath(const ["location"]))["city"],
      barangay: snapshot.get(FieldPath(const ["location"]))["barangay"],
    );
  }

  Stream<AbangUser> get userDataStream {
    return _userCollection
        .doc(
          FirebaseAuth.instance.currentUser!.uid,
        )
        .snapshots()
        .map(_abangUserDataFromFirebase);
  }

  //STREAM OF OCCUPIED
  int _occupiedStream(DocumentSnapshot snapshot) {
    return snapshot.get(FieldPath(const ['occupied']));
  }

  Stream<int> get occupiedData {
    return _houseCodes
        .doc(
          houseCode,
        )
        .snapshots()
        .map(_occupiedStream);
  }

  //STREAM OF VACANTS
  int _vacantStream(DocumentSnapshot snapshot) {
    return snapshot.get(FieldPath(const ['vacants']));
  }

  Stream<int> get vacantData {
    return _houseCodes
        .doc(
          houseCode,
        )
        .snapshots()
        .map(_vacantStream);
  }

  //STREAM OF VACANTS
  int _tenantsStream(DocumentSnapshot snapshot) {
    return snapshot.get(FieldPath(const ['tenants']));
  }

  Stream<int> get tenantData {
    return _houseCodes
        .doc(
          houseCode,
        )
        .snapshots()
        .map(_tenantsStream);
  }
}
