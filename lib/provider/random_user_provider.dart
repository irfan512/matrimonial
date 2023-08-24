import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../config/app_constant.dart';
import '../model/get_random_users.dart';
import '../services/api_services.dart';
import '../utils/loader.dart';

class RandomUserProvider extends ChangeNotifier {
  bool check = false;
  bool internet = false;
  List<RendomUsers> randomuser = [];

  int currentIndex = 0;
  Future<void> randomUserData({mapData, context}) async {
    String url = "random_users";
    dynamic res = await ApiClient.getApitCall(url: url, mapData: mapData);
    log(res);
    if (res["status"] == 200) {
      check = true;
      List<dynamic> jsonData = res['data'];
      randomuser = jsonData.map((user) {
        return RendomUsers.fromJson(user);
      }).toList();
      log("RandomUserrrrrrrrrrrrr${randomuser[1].firstName}");
      notifyListeners();
    } else if (res["status"] == 500) {
      Navigator.pop(context);
      toast("$res[message]");
      notifyListeners();
    } else if (res == AppConstant.socketException) {
      Navigator.pop(context);
      check = false;
      internet = true;
      notifyListeners();
      toast("No internet");
    } else if (res["status"] == 200) {
      Navigator.pop(context);
      check = false;
      internet = false;
      notifyListeners();
    }
  }

  Future<void> getNextUser() async {
    currentIndex++; // Increment the index
    if (currentIndex >= randomuser.length) {
      // If index exceeds the fetched user count, fetch more users from the API
      currentIndex = 0;
      await randomUserData();
    }
    notifyListeners(); // Notify listeners to update the UI
  }
}
