
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task_firebase/shared/constant/snack_bar_toast.dart';

class RegisterService {
  static RegisterService? _instance;

  RegisterService._internal();

  static RegisterService getInstance() {
    _instance ??= RegisterService._internal();
    return _instance!;
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future register(BuildContext context, String name, String email,
      String password, String phone, String country) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      CollectionReference userRef = firestore.collection("users");
      DocumentReference userDoc = userRef.doc(user!.uid);

      userDoc.set({
        "userEmail": email,
        "userPassword": password,
        "date": DateTime.now(),
        "userName": name,
        "userUid": user.uid,
        "userPhone": phone,
        "userCountry": country,
      }, SetOptions(merge: true));
      AppSnackBarToast.showSnackBarToast(context, "User SignUp Successfully");
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        AppSnackBarToast.showSnackBarToast(context, "weak password");
        return false;
      } else if (e.code == 'invalid-email') {
        AppSnackBarToast.showSnackBarToast(context, "Invalid email");
        return false;
      } else if (e.code == 'email-already-in-use') {
        AppSnackBarToast.showSnackBarToast(context, "email already in use");
        return false;
      } else if (e.code == "network-request-failed") {
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

