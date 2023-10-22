import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'shared/auth/routes.dart';
import 'shared/constant/app_details.dart';
import 'shared/firebaseOption.dart';
import 'shared/page/splash_page.dart';
import 'shared/provider/themeProvider.dart';
import 'shared/service/themeService.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // name: 'task_firebase',
      options: DefaultFirebaseOptions.currentPlatform);

  // runApp(const MyApp());
  final ThemeData initialTheme =await ThemeManager().fetchAndApplyTheme(); // Fetch your theme data
  runApp(
  ChangeNotifierProvider(
    create: (context) => ThemeProvider(initialTheme),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      theme: themeProvider.currentTheme,
      title: AppDetails.appName,
      debugShowCheckedModeBanner: false,
      routes: routes,
      home: const SplashPage(),
    );
  }
}

