import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../config/app_constant.dart';
import '../model/get_random_users.dart';
import '../services/api_services.dart';
import '../utils/loader.dart';

class RequestUserProvider extends ChangeNotifier {
  bool check = false;
  bool internet = false;
  List<RendomUsers> requests = [];

  Future<void> getFriendsRequest({mapData, context}) async {
    String url = "friend_requests";
    dynamic res = await ApiClient.getApitCall(url: url, mapData: mapData);
    log(res);
    if (res["status"] == 200) {
      check = true;
      List<dynamic> jsonData = res['data'];
      requests = jsonData.map((user) {
        return RendomUsers.fromJson(user);
      }).toList();
      log("RandomUserrrrrrrrrrrrr${requests[1].firstName}");
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

  Future acceptRequest({mapData, context}) async {
    String url = "friend_requests/accept";
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

  Future sendRequest({mapData, context}) async {
    String url = "friend_requests/send";
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

  Future removeRequest({mapData, context, index}) async {
    String url = "friend_requests/reject";
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
    requests.removeAt(index);
    notifyListeners();
  }
}
