import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../config/app_constant.dart';
import '../screen/landing_page.dart';
import '../services/api_services.dart';
import '../utils/loader.dart';

class AuthController extends ChangeNotifier {
  bool loading = false;
  bool internet = false;
  Future<void> register(
      {required Map<String, dynamic> mapData,
      required BuildContext context}) async {
    loading = true;
    internet = false;
    String url = "register";
    customLoader(context: context);
    dynamic res = await ApiClient.postApitCall(url: url, mapData: mapData);
    log("auth response is ${res}");
    if (res[AppConstant.apiStatus] == 200) {
      Navigator.pop(context);
      toast("Register Account Successfully");
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => BottomBarTab()),
          (route) => false);

      loading = false;
      notifyListeners();
    } else if (res["status"] == 500) {
      Navigator.pop(context);
      toast("$res[message]");
      notifyListeners();
    } else if (res == AppConstant.socketException) {
      Navigator.pop(context);
      loading = false;
      internet = true;
      notifyListeners();
      toast("No internet");
    } else if (res["status"] == 200) {
      Navigator.pop(context);
      loading = false;
      internet = false;
      notifyListeners();
    }
  }

// Login api////////////////////////////////////////////////////
  Future<void> loginAppUser({required mapData, required context}) async {
    loading = false;
    internet = false;
    customLoader(context: context);
    dynamic res = await ApiClient.postApitCall(url: "login", mapData: mapData);
    log("auth response is $res");
    if (res == AppConstant.socketException) {
      Navigator.pop(context);
      loading = false;
      internet = true;
      notifyListeners();
      toast("No internet");
    } else if (res["message"] == "Invalid credentials") {
      Navigator.pop(context);
      loading = false;
      internet = false;
      notifyListeners();
      toast("${res["message"]}");
    } else if (res["api_status"] == 400.toString()) {
      Navigator.pop(context);
      loading = false;
      internet = false;
      notifyListeners();
      toast("${res["errors"]["error_text"]}");
    } else if (res["status"] == 200) {
      Navigator.pop(context);
      log(res["message"]);
      await setValue("access_token", res["data"]["token"]);
      toast("Login successfully");
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => BottomBarTab()),
          (route) => false);
    }
    loading = false;
    notifyListeners();
  }

  // Logout api

  Future<void> logoutUser({required context}) async {
    customLoader(context: context);
    dynamic res = await ApiClient.getApitCall(
      url: "logout",
    );
  }
}
