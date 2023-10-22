import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_firebase/shared/constant/user_info.dart';

class LocalDataSaver {
  static String idKey = "ID Key";
  static String nameKey = "Name Key";
  static String emailKey = "Email Key";
  static String passwordKey = "Password Key";
  static String phoneKey = "Phone Key";
  static String uidKey = "Uid Key";
  static String logKey = "Log Key";


  static Future<bool> saveUserID(String? userID) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(idKey, userID!);
  }

  static Future<String?> getUserID() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(idKey);
  }

  static Future<bool> saveUserName(String? userName) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(nameKey, userName!);
  }

  static Future<String?> getUserName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(nameKey);
  }

  static Future<bool> saveUserEmail(String? userEmail) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(emailKey, userEmail!);
  }

  static Future<String?> getUserEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(emailKey);
  }
  static Future<bool> saveUserPhone(String? userPhone) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(phoneKey, userPhone!);
  }

  static Future<String?> getUserPhone() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(phoneKey);
  }

  static Future<bool> saveUserPassword(String? userPassword) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(passwordKey, userPassword!);
  }

  static Future<String?> getUserPassword() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(passwordKey);
  }


  static Future<bool> saveUserLogData(bool? isUserLoggedIn) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setBool(logKey, isUserLoggedIn!);
  }

  static Future<bool?> getUserLogData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(logKey);
  }


  static Future fetchDataSPreferences() async {
    UserDetails.userID = await LocalDataSaver.getUserID();
    UserDetails.userName = await LocalDataSaver.getUserName();
    UserDetails.userEmail = await LocalDataSaver.getUserEmail();
    UserDetails.userPhone = await LocalDataSaver.getUserPhone();
    UserDetails.userPassword = await LocalDataSaver.getUserPassword();
  }


static  Future removeDataSPreferences() async {
    saveUserLogData(false);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove("ID Key");
    await preferences.remove("Name Key");
    await preferences.remove("Email Key");
    await preferences.remove("Phone Key");
    await preferences.remove("Password Key");
    await preferences.clear();
  }
}



