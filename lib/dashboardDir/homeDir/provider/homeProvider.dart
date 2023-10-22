
import 'package:flutter/material.dart';
import 'package:task_firebase/dashboardDir/homeDir/model/apiDataModel.dart';
import 'package:task_firebase/dashboardDir/homeDir/service/homeService.dart';

class HomeProvider extends ChangeNotifier {
  bool isLoading = false;
List<ApiDataModel> apiDataList=[];
  apiData(context) async {
    isLoading = true;
    notifyListeners();
    apiDataList= await HomeService.getInstance().apiData(context);
    isLoading = false;
    notifyListeners();
  }
}
