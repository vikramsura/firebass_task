import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_firebase/shared/constant/colors.dart';
import 'package:task_firebase/shared/constant/font_size.dart';
import 'package:task_firebase/shared/constant/user_info.dart';
import 'package:task_firebase/shared/provider/userDataProvider.dart';

import '../provider/homeProvider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeProvider homeProvider = HomeProvider();
  UserDataProvider userDataProvider = UserDataProvider();

  getData() {
    homeProvider.apiData(context);
    userDataProvider.userData();
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    deviceHeight(MediaQuery.of(context).size.height);
    return ChangeNotifierProvider<HomeProvider>(
      create: (_) {
        return HomeProvider()..apiData(context);
      },
      child: Consumer<HomeProvider>(
        builder: (context, provider, child) {
          // provider.apiData(context);
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: Text(UserDetails.userName.toString(),
                    style: TextStyle(
                        color: AppColors.white,
                        fontSize: AppFontSize.font22,
                        fontWeight: FontWeight.bold)),
                centerTitle: true,
              ),
              body: provider.isLoading
                  ?  Center(child: CircularProgressIndicator(color: AppColor.fieldBorderColor(context),))
                  : provider.apiDataList.isEmpty
                      ? const Center(child: Text("Data not found"))
                      : ListView.builder(
                          itemCount: provider.apiDataList.length,
                          itemBuilder: (context, index) {
                            var item = provider.apiDataList[index];
                            return Padding(
                              padding: EdgeInsets.all(AppFontSize.font4),
                              child: Card(
                                child: Padding(
                                  padding:  EdgeInsets.all(AppFontSize.font8),
                                  child: ListTile(
                                    title: Text(item.title.toString(), maxLines: 1),
                                    subtitle:
                                        Text(item.body.toString(), maxLines: 2),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
            ),
          );
        },
      ),
    );
  }
}
