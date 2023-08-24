import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:us_muslim_match/config/theme.dart';
import 'package:us_muslim_match/config/global_context.dart';
import 'package:us_muslim_match/provider/auth_provider.dart';
import 'package:us_muslim_match/provider/notification_provider.dart';
import 'package:us_muslim_match/provider/random_user_provider.dart';
import 'package:us_muslim_match/screen/auth/login.dart';
import 'package:us_muslim_match/screen/auth/phone_verify.dart';
import 'package:us_muslim_match/screen/auth/verification.dart';
import 'package:us_muslim_match/screen/landing_page.dart';
import 'package:us_muslim_match/screen/splash_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:us_muslim_match/screen/steps/question_six.dart';
import 'package:us_muslim_match/screen/steps/widgets/gender.dart';
import 'package:us_muslim_match/screen/steps/widgets/question_one.dart';
import 'screen/steps/steps.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => AuthController()),
          ChangeNotifierProvider(create: (context) => RandomUserProvider()),
          ChangeNotifierProvider(create: (context) => NotificationProvider()),
        ],
        child: Sizer(builder: (context, orientation, deviceType) {
          return MaterialApp(
            // theme: myTheme,
            // navigatorKey: NavigationService.navigatorKey,
            debugShowCheckedModeBanner: false,
            // home: SplashPage(),
            // home: const Steps(),
            home: SplashPage(),
          );
        }));
  }
}
  // ThemeData _buildTheme(brightness) {
  //   var baseTheme = ThemeData(brightness: brightness);

  //   return baseTheme.copyWith(
  //     textTheme: GoogleFonts.heeboTextTheme(baseTheme.textTheme),
  //   );
  // }

