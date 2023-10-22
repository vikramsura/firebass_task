
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task_firebase/shared/auth/local_db_saver.dart';
import 'package:task_firebase/shared/constant/snack_bar_toast.dart';
import 'package:task_firebase/shared/constant/user_info.dart';

class ProfileService {
  static ProfileService? _instance;

  ProfileService._internal();

  static ProfileService getInstance() {
    _instance ??= ProfileService._internal();
    return _instance!;
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future accDelete(BuildContext context) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      var user = _auth.currentUser!;



      firestore.collection("users").doc(UserDetails.userID).delete();_auth.signOut();LocalDataSaver.removeDataSPreferences();await user.delete();
      AppSnackBarToast.showSnackBarToast(
          context, "User account deleted successfully");
      return true;
    } on FirebaseAuthException catch (e) {
      AppSnackBarToast.showSnackBarToast(context, "Something went wrong");
      return false;
    }
  }

  Future logOut(BuildContext context) async {
    try {
      LocalDataSaver.removeDataSPreferences();
      _auth.signOut();
      AppSnackBarToast.showSnackBarToast(
          context, "User Signed Out Successfully");
      return true;
    } on FirebaseAuthException catch (e) {
      AppSnackBarToast.showSnackBarToast(context, "Something went wrong");
      return false;
    }
  }
}
