import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:us_muslim_match/screen/auth/sign_up.dart';

import '../../config/colors.dart';
import '../../provider/auth_provider.dart';
import '../../utils/images.dart';
import '../../widgets/custom_textfield.dart';

class EmailLogin extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

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
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Image(
                        image: AssetImage(AppImages.splash),
                        height: 150,
                        width: 250,
                        fit: BoxFit.fitHeight,
                      ),
                      Text(
                        'Login to Muslim Match',
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: ColorConstants.primaryColor
                            // fontFamily: fNSfUiSemiBold,
                            ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            CustomFormField(
                              color: Colors.white70,
                              hintText: "username/email",
                              icon: Icons.email,
                              border: 10,
                              isPasswordField: true,
                              controller: email,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Email is required';
                                }
                                // Add additional password validation if needed
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomFormField(
                              color: Colors.white70,
                              hintText: "Password",
                              icon: Icons.lock,
                              border: 10,
                              isPasswordField: true,
                              controller: password,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Password is required';
                                }
                                // Add additional password validation if needed
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                bottom: 10.0,
                              ),
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                // onTap: () => Navigator.of(context).pushNamed(ColorConstants.lightPurple),
                                child: Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                    color: ColorConstants.primaryColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          //  FocusManager.instance.primaryFocus!.unfocus();
                          // Navigator.of(context)
                          //     .pushReplacementNamed(AppRoutes.login);
                          if (_formKey.currentState!.validate()) {
                            Map<String, dynamic> mapData = {
                              "password": password.text.trim(),
                              "email_username": email.text.trim(),
                            };
                            context.read<AuthController>().loginAppUser(
                                mapData: mapData, context: context);
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              border: Border.all(
                                  color: ColorConstants.primaryColor)),
                          height: 45,
                          width: 210,
                          child: Center(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: ColorConstants.primaryColor,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(top: 20.0),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "Don't have an account? ",
                            style: Theme.of(context).textTheme.bodyText1,
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Sign Up',
                                style: TextStyle(
                                  color: ColorConstants.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Signup()));
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 35,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
