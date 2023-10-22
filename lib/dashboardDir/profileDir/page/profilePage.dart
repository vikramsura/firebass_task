import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_firebase/dashboardDir/profileDir/provider/profileProvider.dart';
import 'package:task_firebase/shared/constant/appButton.dart';
import 'package:task_firebase/shared/constant/app_details.dart';
import 'package:task_firebase/shared/constant/colors.dart';
import 'package:task_firebase/shared/constant/font_size.dart';
import 'package:task_firebase/shared/constant/user_info.dart';
import 'package:task_firebase/shared/provider/themeProvider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    deviceHeight(MediaQuery.of(context).size.height);
    return ChangeNotifierProvider<ProfileProvider>(
      create: (_) {
        return ProfileProvider();
      },
      child: Consumer<ProfileProvider>(
        builder: (context, provider, child) {
          return SafeArea(
            child: Stack(
              children: [
                Scaffold(
                  appBar: AppBar(
                    title: Text(AppDetails.appName,
                        style: TextStyle(
                            color: AppColors.white,
                            fontSize: AppFontSize.font22,
                            fontWeight: FontWeight.bold)),

                    actions: [
                      ThemeSwitch(),
                      SizedBox(
                        width: AppFontSize.font10,
                      )
                    ],
                  ),
                  body: Padding(
                    padding: EdgeInsets.all(AppFontSize.font12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: AppFontSize.font30,
                        ),
                        Text("User Name: ${UserDetails.userName.toString()}",
                            style: TextStyle(
                                fontSize: AppFontSize.font18,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: AppFontSize.font20,
                        ),
                        Text("User Email: ${UserDetails.userEmail.toString()}",
                            style: TextStyle(
                                fontSize: AppFontSize.font18,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: AppFontSize.font20,
                        ),
                        Text("User Phone: ${UserDetails.userPhone.toString()}",
                            style: TextStyle(
                                fontSize: AppFontSize.font18,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: AppFontSize.font50,
                        ),
                        InkWell(
                            onTap: () {print("object${UserDetails.userPhone}");
                              buildShowDialog(context, provider, "Log Out");
                            },
                            child:
                                AppButtons.elevatedButton("Sign Out", context)),
                        SizedBox(
                          height: AppFontSize.font20,
                        ),
                        InkWell(
                            onTap: () {
                              buildShowDialog(
                                  context, provider, "Delete Account");
                            },
                            child: AppButtons.elevatedButton(
                                "Delete Account", context)),

                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: provider.isLoading,
                  child: Scaffold(
                    backgroundColor: Colors.black45,
                    body: Center(
                      child: CircularProgressIndicator(
                        color: AppColor.fieldBorderColor(context),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Future<dynamic> buildShowDialog(
      BuildContext context, ProfileProvider provider, String title) {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: Text("Are you sure you want to $title?"),
        actions: <Widget>[
          TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
                title == "Log Out"
                    ? provider.logOut(context)
                    : provider.accountDelete(context);
              },
              child: const Text("Yes")),
          TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: const Text("No")),
        ],
      ),
    );
  }
}

class ThemeSwitch extends StatefulWidget {
  @override
  _ThemeSwitchState createState() => _ThemeSwitchState();
}

class _ThemeSwitchState extends State<ThemeSwitch> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    bool isDarkMode = themeProvider.currentTheme?.brightness == Brightness.dark;

    return Switch(
      value: isDarkMode,
      onChanged: (value) {
        if (value) {
          themeProvider.setTheme(ThemeData.dark());
        } else {
          themeProvider.setTheme(ThemeData.light());
        }
      },
    );
  }
}
