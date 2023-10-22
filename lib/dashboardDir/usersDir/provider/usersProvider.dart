
import 'package:flutter/cupertino.dart';
import 'package:task_firebase/dashboardDir/usersDir/service/usersService.dart';

class UsersProvider extends ChangeNotifier {
  bool isLoading = false;

  List<Map<String, dynamic>> _userList = [];

  List<Map<String, dynamic>> get userList => _userList;


  getUserDataList(context) async {
    userList.clear();
    isLoading = true;
    notifyListeners();
    _userList = await UsersService.getInstance().getUsers(context);
    isLoading = false;
    notifyListeners();
  }
}
