import 'package:flutter/cupertino.dart';
import 'package:task_firebase/shared/service/getUserDataService.dart';

class UserDataProvider extends ChangeNotifier {
  bool isLoading = true;
  List userDataList = [];

  userData() async {
    isLoading = true;
    userDataList.clear();
    notifyListeners();
    userDataList = await UserDataService.getInstance().userData();
    isLoading = false;
    notifyListeners();
  }
}
