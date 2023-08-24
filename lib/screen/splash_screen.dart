import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:us_muslim_match/screen/auth/login.dart';
import 'package:us_muslim_match/services/api_services.dart';
import 'package:provider/provider.dart';
import '../model/get_site_setting.dart';
import '../provider/random_user_provider.dart';
import '../utils/images.dart';
import 'landing_page.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
  var accessToken = getStringAsync('token');
}

class _SplashPageState extends State<SplashPage> {
  startTimer() async {
    var duration = const Duration(seconds: 4);
    return Timer(duration, navigationPage);
  }

  void navigationPage() {
    var accessToken = getStringAsync('access_token');
    if (accessToken == null || accessToken == "") {
      print(
          "asdfffffffffffffffffff"); // Navigator.of(context).pushReplacementNamed(AppRoutes.selection);
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => BottomBarTab()),
          (route) => false);
    }
  }

  GetSiteSetting? site;
  Future<void> getSiteSettings() async {
    dynamic res = await ApiClient.getApitCall(
      url: "get-settings",
    );
    // log("messages $res");
    if (res != null && res.runtimeType != String && res["status"] == 200) {
      site = GetSiteSetting.fromJson(res["data"]);
      await setValue('siteSettings', res['data']);
      navigationPage();
      setState(() {});
    } else {
      toast("Check Your Internet Connection");
    }
  }

  @override
  void initState() {
    startTimer();

    getSiteSettings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Image.asset(
            AppImages.splash,
            height: 210.0,
            width: MediaQuery.of(context).size.width * .85,
          ),
        ),
      ),
    );
  }
}
