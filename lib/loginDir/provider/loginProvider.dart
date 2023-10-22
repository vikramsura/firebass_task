
import 'package:flutter/cupertino.dart';
import 'package:task_firebase/loginDir/service/loginService.dart';
import 'package:task_firebase/shared/auth/local_db_saver.dart';
import 'package:task_firebase/shared/auth/routes.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPasswordShow = true;
  bool isLoading = false;

  setShowPassword() {
    isPasswordShow = !isPasswordShow;
    notifyListeners();
  }

  userSign(context) {
    LocalDataSaver.fetchDataSPreferences();
    isLoading = true;
    notifyListeners();
    LoginService.getInstance()
        .signIn(context, emailController.text.trim(),
            passwordController.text.trim())
        .then((value){
          if(value==true){
            Navigator.pushNamedAndRemoveUntil(context, AppRoutes.dashboardPage, (route) => false);
          }
      isLoading = false;
      notifyListeners();
    } );
  }
}
