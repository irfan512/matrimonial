import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../config/app_constant.dart';
import '../model/get_random_users.dart';
import '../services/api_services.dart';
import '../utils/loader.dart';

class NotificationProvider extends ChangeNotifier {
  bool check = false;
  bool internet = false;
  List<RendomUsers> notifications = [];
  Future<void> getNotification({mapData, context}) async {
    String url = "notifications";
    dynamic res = await ApiClient.getApitCall(url: url, mapData: mapData);
    log(res);
    if (res["status"] == 200) {
      check = true;
      List<dynamic> jsonData = res['data'];
      notifications = jsonData.map((user) {
        return RendomUsers.fromJson(user);
      }).toList();
      log("RandomUserrrrrrrrrrrrr${notifications[1].firstName}");
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









  
}
