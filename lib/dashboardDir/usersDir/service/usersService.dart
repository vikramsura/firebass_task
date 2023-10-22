
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:task_firebase/shared/constant/user_info.dart';

class UsersService {
  static UsersService? _instance;

  UsersService._internal();

  static UsersService getInstance() {
    _instance ??= UsersService._internal();
    return _instance!;
  }

List getUserList=[];
  Future getUsers(BuildContext context) async {
    try {
      final firestore = FirebaseFirestore.instance;
      CollectionReference collection = firestore.collection('users');
      QuerySnapshot querySnapshot = await collection.get();

      List<Map<String, dynamic>> getUserList = [];

      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        data["userUid"]==UserDetails.userID
            ? null:
        getUserList.add(data);

      }

      return getUserList;
    } catch (e) {
      return getUserList;
    }
  }
}
