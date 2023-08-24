import 'package:flutter/material.dart';
import 'package:us_muslim_match/config/global_context.dart';

const Color primaryColor = Colors.red;
var greyColor = Colors.grey.shade300;
const Color themeColor = Color(0xff870F4E);
const blackColor = Colors.black;
// dark theme
var dartTheme = (context) => ThemeData(
      brightness: Brightness.dark,
      primaryColor: themeColor,
    );

class AppTheme {
  static dartkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: themeColor,
      
      cardTheme: CardTheme(
        color: blackColor
      )
    );
  }

  static lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: themeColor,


      
    );
  }

  static bool get isDark{
    final isPlatformDark =
        WidgetsBinding.instance.platformDispatcher.platformBrightness ==
            Brightness.dark;
    return isPlatformDark;
  }
}
  //    ThemeData(
  //   brightness: Brightness.dark,
  //   primaryColor: themeColor,
  //   scaffoldBackgroundColor:blackColor,
  //    iconTheme:const IconThemeData(
  //     color: Colors.white
  //    ),
  //    textTheme:  Theme.of(context).textTheme.apply(
  //     bodyColor: Colors.black,
  //     displayColor: Colors.white, 
  //   ),
  //   iconButtonTheme:IconButtonThemeData(
  //     style:ButtonStyle(
  //       iconColor: MaterialStateProperty.all(themeColor)
  //     )
  //   ),
  //   buttonTheme: const ButtonThemeData(
  //     buttonColor: Colors.white,
  //   ),
  //   appBarTheme:const AppBarTheme(
  //     backgroundColor: Colors.black
  //   )
  // );