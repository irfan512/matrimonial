// import 'dart:ui';

// import 'package:convex_bottom_bar/convex_bottom_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';
// import 'package:us_muslim_match/config/colors.dart';
// import 'package:us_muslim_match/screen/chat/chat.dart';
// import 'package:us_muslim_match/screen/explore/explore.dart';
// import 'package:us_muslim_match/screen/home_page.dart';
// import 'package:us_muslim_match/screen/setting.dart';
// import 'package:us_muslim_match/utils/extensions.dart';
// import 'package:us_muslim_match/utils/utils.dart';
// import 'package:us_muslim_match/widgets/custom_text.dart';

// class LandingPage extends StatefulWidget {
//   const LandingPage({super.key});

//   @override
//   State<LandingPage> createState() => _LandingPageState();
// }

// class _LandingPageState extends State<LandingPage> {
//   int index=0;

// // int selectedItemposition=0;

//   final List _pages=[
//      HomePage(),
//     Explore(),
//     Messages(),
//     Setting(),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       bottomNavigationBar: ConvexAppBar(
//         backgroundColor: themeColor,
//       shadowColor: Colors.transparent,
//     items: const [
//       TabItem(icon: Icons.home, title: 'Home'),
//       TabItem(icon: Icons.explore_sharp, title: 'Explore'),
//       TabItem(icon: Icons.message, title: 'Message'),
//       TabItem(icon: Icons.people, title: 'Profile'),
//     ],
//     onTap: (int i) {
//       index=i;
//       setState(() {

//       });
//     },
//   ),
//   body: _pages[index],
//     );
//   }
// List<String> icons=[
// "assets/icons/edit.png",
// "assets/icons/setting.png",
// "assets/icons/help.png",
// "assets/icons/support.png",
// "assets/icons/share.png",
//   ];
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:us_muslim_match/screen/setting.dart';
import 'package:us_muslim_match/config/colors.dart';

import 'chat/chat.dart';
import 'explore/explore.dart';
import 'home/home_page.dart';

int selectedItemPosition = 0;

class BottomBarTab extends StatefulWidget {
  const BottomBarTab({Key? key}) : super(key: key);

  @override
  _BottomBarTabState createState() => _BottomBarTabState();
}

class _BottomBarTabState extends State<BottomBarTab> {
  // ShapeBorder? bottomBarShape = const RoundedRectangleBorder(
  //   borderRadius: BorderRadius.all(Radius.circular(25)),
  // );

  EdgeInsets padding = const EdgeInsets.fromLTRB(0, 2, 0, 0);

  void onTabTapped(int index) {
    setState(() {
      selectedItemPosition = index;
    });
  }

  bool popval = false;

  final List _pages = [
    HomePage(),
    Explore(),
    Messages(),
    Setting(),
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (selectedItemPosition == 0) {
          final shouldPop = await showDialog<bool>(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return CupertinoAlertDialog(
                title: const Text(
                  'Are you sure to exit app?',
                ),
                actions: [
                  CupertinoDialogAction(
                    onPressed: () {
                      setState(() {
                        popval = true;
                      });
                      Navigator.of(context).pop(true);
                    },
                    child: Text(
                      'Yes',
                      style: TextStyle(
                          color: ColorConstants.primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  CupertinoDialogAction(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: const Text(
                      'No',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              );
            },
          );
          return Future.value(popval);
        } else {
          onTabTapped(0);
          return Future.value(false);
        }
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: true,
        extendBody: true,
        body: _pages[selectedItemPosition],
        bottomNavigationBar: BottomAppBar(
          height: 50,
          elevation: 10,
          color: Colors.white,
          shape: CircularNotchedRectangle(), //shape of notch
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 2.0),
            child: Row(
              //children inside bottom appbar
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    selectedItemPosition = 0;
                    setState(() {});
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        selectedItemPosition == 0
                            ? Icons.home
                            : Icons.home_outlined,
                        color: selectedItemPosition == 0
                            ? ColorConstants.primaryColor
                            : Colors.black,
                        size: 20,
                      ),
                      Text(
                        "Home",
                        style: TextStyle(
                          color: selectedItemPosition == 0
                              ? ColorConstants.primaryColor
                              : Colors.black,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    selectedItemPosition = 1;
                    setState(() {});
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        selectedItemPosition == 1
                            ? Icons.explore
                            : Icons.explore_outlined,
                        color: selectedItemPosition == 1
                            ? ColorConstants.primaryColor
                            : Colors.black,
                        size: 20,
                      ),
                      Text(
                        "Explore",
                        style: TextStyle(
                          color: selectedItemPosition == 1
                              ? ColorConstants.primaryColor
                              : Colors.black,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    selectedItemPosition = 2;
                    setState(() {});
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        selectedItemPosition != 2
                            ? CupertinoIcons.bolt_horizontal_circle
                            : CupertinoIcons.bolt_horizontal_circle_fill,
                        color: selectedItemPosition == 2
                            ? ColorConstants.primaryColor
                            : Colors.black,
                        size: 20,
                      ),
                      Text(
                        "chats",
                        style: TextStyle(
                          color: selectedItemPosition == 2
                              ? ColorConstants.primaryColor
                              : Colors.black,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    selectedItemPosition = 3;
                    setState(() {});
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        selectedItemPosition != 3
                            ? Icons.settings_outlined
                            : Icons.settings,
                        color: selectedItemPosition == 2
                            ? ColorConstants.primaryColor
                            : Colors.black,
                        size: 20,
                      ),
                      Text(
                        "setting",
                        style: TextStyle(
                          color: selectedItemPosition == 2
                              ? ColorConstants.primaryColor
                              : Colors.black,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
