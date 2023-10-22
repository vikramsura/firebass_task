
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task_firebase/shared/auth/local_db_saver.dart';
import 'package:task_firebase/shared/constant/snack_bar_toast.dart';

class LoginService {
  static LoginService? _instance;

  LoginService._internal();

  static LoginService getInstance() {
    _instance ??= LoginService._internal();
    return _instance!;
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signIn(BuildContext context, String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      LocalDataSaver.saveUserEmail(email);
      LocalDataSaver.saveUserPassword(password);
      LocalDataSaver.saveUserLogData(true);
      LocalDataSaver.saveUserID(_auth.currentUser!.uid);
      LocalDataSaver.fetchDataSPreferences();
      return true;
    } on FirebaseAuthException catch (error) {
      if (error.code == "user-not-found") {
        AppSnackBarToast.showSnackBarToast(context, "User not found");
        return false;
      } else if (error.code == "wrong-password") {
        AppSnackBarToast.showSnackBarToast(context,
            "The password is invalid or the user does not have a password");
        return false;
      } else if (error.code == "too-many-requests") {
        AppSnackBarToast.showSnackBarToast(context,
            "We have blocked all requests from this device due to unusual activity. Please try again later.");
        return false;
      } else if (error.code == "network-request-failed") {
        AppSnackBarToast.showSnackBarToast(
            context, "A network error has occurred.");
        return false;
      } else {
        AppSnackBarToast.showSnackBarToast(context, "Something went wrong");
        return false;
      }
    }
  }
}
