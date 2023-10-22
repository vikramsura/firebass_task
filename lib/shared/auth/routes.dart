

import 'package:flutter/material.dart';
import 'package:task_firebase/dashboardDir/homeDir/page/homePage.dart';
import 'package:task_firebase/dashboardDir/profileDir/page/profilePage.dart';
import 'package:task_firebase/dashboardDir/usersDir/page/usersPage.dart';
import 'package:task_firebase/loginDir/page/loginPage.dart';
import 'package:task_firebase/loginDir/page/registerPage.dart';
import 'package:task_firebase/shared/page/dashboard_page.dart';
import 'package:task_firebase/shared/page/splash_page.dart';

class AppRoutes {
  static const String splashPage = "Splash Page";
  static const String dashboardPage = "Dashboard Page";
  static const String homePage = "Home Page";
  static const String profilePage = "Profile Page";
  static const String usersPage = "Users Page";
  static const String loginPage = "Login Page";
  static const String registerPage = "Register Page";
}

Map<String, WidgetBuilder> routes = {
  AppRoutes.splashPage: (context) => const SplashPage(),
  AppRoutes.dashboardPage: (context) => const DashBoardPage(),
  AppRoutes.homePage: (context) => const HomePage(),
  AppRoutes.profilePage: (context) => const ProfilePage(),
  AppRoutes.usersPage: (context) => const UsersPage(),
  AppRoutes.loginPage: (context) => const LoginPage(),
  AppRoutes.registerPage: (context) => const RegisterPage(),
};
