
import 'package:flutter/material.dart';
import 'package:task_firebase/shared/auth/local_db_saver.dart';
import 'package:task_firebase/shared/auth/routes.dart';
import 'package:task_firebase/shared/constant/app_details.dart';
import 'package:task_firebase/shared/constant/font_size.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  getLoggedData() {
    LocalDataSaver.getUserLogData().then((value) async {
      LocalDataSaver.fetchDataSPreferences();
      if (value == true) {
        Future.delayed(const Duration(seconds: 3), () {
          Navigator.pushReplacementNamed(context, AppRoutes.dashboardPage);
        });
      } else {
        Future.delayed(const Duration(seconds: 3), () {
          Navigator.pushReplacementNamed(context, AppRoutes.loginPage);
        });
      }
    });
  }

  @override
  void initState() {
    getLoggedData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    deviceHeight(MediaQuery.of(context).size.height);
    return const Scaffold(
      body: Center(
        child: Text(AppDetails.appName),
      ),
    );
  }
}
