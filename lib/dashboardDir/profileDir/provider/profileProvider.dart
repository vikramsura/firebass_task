
import 'package:flutter/cupertino.dart';
import 'package:task_firebase/dashboardDir/profileDir/service/profileService.dart';
import 'package:task_firebase/shared/auth/routes.dart';

class ProfileProvider extends ChangeNotifier {
  bool isLoading = false;

  accountDelete(context) {
    isLoading = true;
    notifyListeners();
    ProfileService.getInstance().accDelete(context).then((value) {
      if (value == true) {
        Navigator.pushNamedAndRemoveUntil(
            context, AppRoutes.loginPage, (route) => false);
      }
      isLoading = false;
      notifyListeners();
    });
  }

  logOut(context) {
    isLoading = true;
    notifyListeners();
    ProfileService.getInstance().logOut(context).then((value) {
      if (value == true) {
        Navigator.pushNamedAndRemoveUntil(
            context, AppRoutes.loginPage, (route) => false);
      }
      isLoading = false;
      notifyListeners();
    });
  }
}
