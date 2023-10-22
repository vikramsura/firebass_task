
import 'package:flutter/material.dart';
import 'package:task_firebase/dashboardDir/homeDir/page/homePage.dart';
import 'package:task_firebase/dashboardDir/profileDir/page/profilePage.dart';
import 'package:task_firebase/dashboardDir/usersDir/page/usersPage.dart';
import 'package:task_firebase/shared/constant/colors.dart';
import 'package:task_firebase/shared/constant/font_size.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({Key? key}) : super(key: key);

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  List tabList = [
    const HomePage(),
    const UsersPage(),
    const ProfilePage(),
  ];

  int pageSelected = 0;

  @override
  Widget build(BuildContext context) {
    deviceHeight(MediaQuery.of(context).size.height);
    return Scaffold(
      body: tabList[pageSelected],
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Widget buildBottomNavigationBar() {
    return BottomNavigationBar(
        elevation: 8,
        type: BottomNavigationBarType.fixed,
        currentIndex: pageSelected,
        onTap: onTabSelect,
        iconSize: AppFontSize.font20,
        selectedFontSize: AppFontSize.font12,
        unselectedFontSize: AppFontSize.font12,
        selectedItemColor: AppColor.selectIconColor(context),
        unselectedItemColor: AppColor.unSelectIconColor(context),
        showUnselectedLabels: true,
        showSelectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_rounded), label: "Users"),
          BottomNavigationBarItem(
              icon: Icon(Icons.verified_user_rounded), label: "Profile"),
        ]);
  }

  onTabSelect(index) {
    setState(() {
      pageSelected = index;
    });
  }
}
