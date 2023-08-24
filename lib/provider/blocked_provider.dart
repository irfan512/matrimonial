import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../config/app_constant.dart';
import '../model/get_random_users.dart';
import '../services/api_services.dart';
import '../utils/loader.dart';

class BlockedUserProvider extends ChangeNotifier {
  bool check = false;
  bool internet = false;
  List<RendomUsers> blockedUserlist = [];



  Future<void> blockUsers({mapData, context}) async {
    String url = "blocked/get_all";
    dynamic res = await ApiClient.getApitCall(url: url, mapData: mapData);
    log(res);
    if (res["status"] == 200) {
      check = true;
      List<dynamic> jsonData = res['data'];
      blockedUserlist = jsonData.map((user) {
        return RendomUsers.fromJson(user);
      }).toList();
      log("RandomUserrrrrrrrrrrrr${blockedUserlist[1].firstName}");
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



  Future blockAdd({mapData, context}) async {
    String url = "blocked/add";
    dynamic res = await ApiClient.getApitCall(url: url, mapData: mapData);

    log(res);
    if (res["status"] == 200) {
      check = true;
//
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



  Future blockRemove({mapData, context, index}) async {
    String url = "blocked/remove";
    dynamic res = await ApiClient.getApitCall(url: url, mapData: mapData);
    log(res);
    if (res["status"] == 200) {
      check = true;
      removeUserAtIndex(index);
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


  removeUserAtIndex(index) {
    blockedUserlist.removeAt(index);
    notifyListeners();
  }


}
