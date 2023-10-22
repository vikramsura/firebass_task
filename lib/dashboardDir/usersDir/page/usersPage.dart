
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_firebase/dashboardDir/usersDir/provider/usersProvider.dart';
import 'package:task_firebase/shared/constant/app_details.dart';
import 'package:task_firebase/shared/constant/colors.dart';
import 'package:task_firebase/shared/constant/font_size.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  UsersProvider usersProvider = UsersProvider();

  @override
  void initState() {
    usersProvider.getUserDataList(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    deviceHeight(MediaQuery.of(context).size.height);
    return ChangeNotifierProvider<UsersProvider>(create: (_) {
      return UsersProvider()..getUserDataList(context);
    }, child: Consumer<UsersProvider>(
      builder: (context, provider, child) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
                title: Text(AppDetails.appName.toString(),style: TextStyle(
                    color: AppColors.white,
                    fontSize: AppFontSize.font22,
                    fontWeight: FontWeight.bold)), centerTitle: true,),
            body: provider.isLoading
                ?  Center(child: CircularProgressIndicator(color: AppColor.fieldBorderColor(context),))
                : provider.userList.isEmpty
                    ?  Center(child: Text("No user found"))
                    : Padding(
                      padding:  EdgeInsets.all(AppFontSize.font12),
                      child: ListView.builder(
                          itemCount: provider.userList.length,
                          itemBuilder: (context, index) {
                            var item = provider.userList[index];
                            return Card(
                              child: Padding(
                                padding:  EdgeInsets.all(AppFontSize.font8),
                                child: ListTile(
                                  title: Text(item["userName"??" "],style: TextStyle(
                                      fontSize: AppFontSize.font18,
                                      fontWeight: FontWeight.bold)),
                                  subtitle: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(item["userEmail"??" "],style: TextStyle(
                                          fontSize: AppFontSize.font14,
                                          fontWeight: FontWeight.bold)),
                                      Text(item["userPhone"??" "],style: TextStyle(
                                          fontSize: AppFontSize.font14,
                                          fontWeight: FontWeight.bold))
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                    ),
          ),
        );
      },
    ));
  }
}
