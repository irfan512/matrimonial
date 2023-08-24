import 'dart:io';
import 'package:flutter/material.dart';
import 'package:us_muslim_match/utils/images.dart';
import '../../config/colors.dart';
import 'email_login.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            // color: colorPrimaryDark,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(15),
              topLeft: Radius.circular(15),
            ),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    const Image(
                      image: AssetImage(AppImages.splash),
                      height: 150,
                      width: 250,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Welcome to Muslim Match',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: ColorConstants.primaryColor
                          // fontFamily: fNSfUiSemiBold,
                          ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Connect with your soul mate that can be nearby or within your city.!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: colorTextLight,
                          // fontFamily: fNSfUiLight,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => SignInScreen(),
                        //     )).then((value) {});
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            border:
                                Border.all(color: ColorConstants.primaryColor)),
                        height: 45,
                        width: 210,
                        child: Row(
                          children: const [
                            SizedBox(
                              width: 15,
                            ),
                            Image(
                              image: AssetImage(AppImages.facebook),
                              height: 22,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'Sign in With Facebook',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            border:
                                Border.all(color: ColorConstants.primaryColor)),
                        height: 45,
                        width: 210,
                        child: Row(
                          children: const [
                            SizedBox(
                              width: 15,
                            ),
                            Image(
                              image: AssetImage(AppImages.google),
                              height: 22,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'Sign in With Google',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EmailLogin()));
                      },
                      child: const Text(
                        'Continue With Email',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 75,
                    ),
                    const Text(
                      'By continuing, you agree to  Muslim Match\'s terms of use\nand confirm that you have read our privacy policy.',
                      style: TextStyle(
                        color: colorTextLight,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          child: Text('Term of use'),
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => WebViewScreen(2),
                            //   ),
                            // );
                          },
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        InkWell(
                          child: Text('Privacy Policy'),
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => WebViewScreen(3),
                            //   ),
                            // );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Future<User?> signInWithGoogle() async {
  // void initData() async {
  //   await sessionManager.initPref();
  // }
}
