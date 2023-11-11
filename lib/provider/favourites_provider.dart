import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../config/app_constant.dart';
import '../model/get_random_users.dart';
import '../services/api_services.dart';
import '../utils/loader.dart';

class FavouriteUserProvider extends ChangeNotifier {
  bool check = false;
  bool internet = false;
  List<RendomUsers> favUsers = [];

  Future<void> getFavourite({mapData, context}) async {
    String url = "favorite/get_all";
    dynamic res = await ApiClient.getApitCall(url: url, mapData: mapData);
    log(res);

    if (res["status"] == 200) {
      check = true;
      List<dynamic> jsonData = res['data'];
      favUsers = jsonData.map((user) {
        return RendomUsers.fromJson(user);
      }).toList();

      notifyListeners();
    } else if (res["status"] == 500) {
      check = false;
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

  Future favAdd({mapData, context}) async {
    String url = "favorite/add";
    dynamic res = await ApiClient.getApitCall(url: url, mapData: mapData);
    log(res);
    if (res["status"] == 200) {
      check = true;
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

  Future favRemove({mapData, context, index}) async {
    String url = "favorite/remove";
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

  makeListEmpty() {
    favUsers = [];
    notifyListeners();
  }

  removeUserAtIndex(index) {
    favUsers.removeAt(index);
    notifyListeners();
  }
}
