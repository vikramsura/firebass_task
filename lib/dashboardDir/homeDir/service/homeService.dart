
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task_firebase/dashboardDir/homeDir/model/apiDataModel.dart';

class HomeService {
  static HomeService? _instance;

  HomeService._internal();

  static HomeService getInstance() {
    _instance ??= HomeService._internal();
    return _instance!;
  }

  List<ApiDataModel> apiDataList = [];

  Future apiData(BuildContext context) async {
    try {
      var response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        for (var jsonData in jsonResponse) {
          if (jsonData is Map<String, dynamic>) {
            apiDataList.add(ApiDataModel.fromJson(jsonData));
          }
        }
        return apiDataList;
      } else {
        if (kDebugMode) {
          print("apiData::${response.body}");
        }
        return apiDataList;
      }
    } catch (e) {
      if (kDebugMode) {
        print("apiDataee::$e");
      }
      return apiDataList;
    }
  }
}
