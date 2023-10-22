import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task_firebase/shared/auth/local_db_saver.dart';
import 'package:task_firebase/shared/constant/user_info.dart';
import 'package:task_firebase/shared/model/userModel.dart';

class UserDataService {
  static UserDataService? _instance;

  UserDataService._internal();

  static UserDataService getInstance() {
    _instance ??= UserDataService._internal();
    return _instance!;
  }

  List userDataList = [];

  Future<List> userData() async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      DocumentSnapshot document =
          await firestore.collection('users').doc(UserDetails.userID).get();
      LocalDataSaver.saveUserID(document["userUid"]);
      LocalDataSaver.saveUserEmail(document["userEmail"]);
      LocalDataSaver.saveUserPhone(document["userPhone"]);
      LocalDataSaver.saveUserPassword(document["userPassword"]);
      LocalDataSaver.saveUserName(document["userName"]);
      LocalDataSaver.fetchDataSPreferences();
      return userDataList;
    } on FirebaseAuthException catch (e) {
      return userDataList;
    }
  }

  QueryDocumentSnapshot? last;
  bool isCancelJob = false;

  Future<List<UserModel>> fetchAllUser() async {
    List<UserModel> allUserDataList = [];
    CollectionReference<Map<String, dynamic>> reference =
        FirebaseFirestore.instance.collection("users");
    QuerySnapshot data;
    data = await reference.orderBy("time", descending: true).get();
    // data = await reference.get();
    if (data != null && data.docs.isNotEmpty) {
      allUserDataList.clear();
      last = data.docs[data.docs.length - 1];
      data.docs.forEach((element) {
        if (element.exists) {
          if (UserDetails.userID == element.id) {
            allUserDataList.add(UserModel.fromJson(element.data() as Map));
          }
        }
      });
    }
    print("allUserDataList::${allUserDataList}");
    return allUserDataList;
  }
}
