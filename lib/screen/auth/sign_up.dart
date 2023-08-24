import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import '../../config/colors.dart';
import '../../provider/auth_provider.dart';
import '../../utils/images.dart';
import '../../widgets/custom_textfield.dart';
import 'email_login.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController fullname = TextEditingController();
  TextEditingController confirmpass = TextEditingController();
  TextEditingController username = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: SafeArea(
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
                      const Image(
                        image: AssetImage(AppImages.splash),
                        height: 150,
                        width: 250,
                        fit: BoxFit.fitHeight,
                      ),
                      Text(
                        'Signup to Muslim Match',
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
                            CustomFormField(
                              color: Colors.white70,
                              hintText: "FullName",
                              icon: Icons.person,
                              border: 10,
                              controller: fullname,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Full Name is required';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomFormField(
                              color: Colors.white70,
                              hintText: "Username",
                              icon: Icons.person,
                              border: 10,
                              controller: username,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Username is required';
                                }
                                if (value.length < 3) {
                                  return 'Username must be at least 3 characters';
                                }
                                if (value.length > 30) {
                                  return 'Username must not exceed 30 characters';
                                }
                                if (!RegExp(r'^[a-zA-Z0-9\.]+$')
                                    .hasMatch(value)) {
                                  return 'Username must contain only alphanumeric characters and dots';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CustomFormField(
                              color: Colors.white70,
                              hintText: "Email Address",
                              icon: Icons.email,
                              border: 10,
                              controller: email,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Email is required';
                                }
                                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                    .hasMatch(value)) {
                                  return 'Enter valid email';
                                }

                                // Add additional email validation if needed
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
                                if (value.length < 8) {
                                  return 'Username must be at least 8 characters';
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
                              hintText: "Confirm Password",
                              icon: Icons.lock,
                              border: 10,
                              isPasswordField: true,
                              controller: confirmpass,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Confirm Password is required';
                                }
                                if (value != password.text) {
                                  return 'Passwords do not match';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          log("TAPPPPPPP");
                          if (_formKey.currentState!.validate()) {
                            log("validateeeeeeeeeeeeeeeeeeeeeeeeeeee");
                            Map<String, dynamic> mapData = {
                              "name": fullname.text,
                              "username": username.text,
                              "email": email.text,
                              "password": password.text,
                              "password_confirm": confirmpass.text,
                            };
                            await Provider.of<AuthController>(context,
                                    listen: false)
                                .register(mapData: mapData, context: context);
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
                              'Signup',
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
                            text: "Already have an account? ",
                            style: Theme.of(context).textTheme.bodyText1,
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Sign in',
                                style: TextStyle(
                                  color: ColorConstants.primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                EmailLogin()));
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:us_muslim_match/widgets/custom_textfield.dart';

// class Signup extends StatefulWidget {
//   @override
//   _SignupState createState() => _SignupState();
// }

// class _SignupState extends State<Signup> {
//   final _formKey = GlobalKey<FormState>();
//   TextEditingController _fullNameController = TextEditingController();
//   TextEditingController _usernameController = TextEditingController();
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();
//   TextEditingController _confirmPasswordController = TextEditingController();
//   TextEditingController email = TextEditingController();
//   TextEditingController password = TextEditingController();
//   TextEditingController fullname = TextEditingController();
//   TextEditingController confirmpass = TextEditingController();
//   TextEditingController username = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Form(
//             key: _formKey,
//             child: Column(
//               children: [
//                 // CustomFormField(
//                 //   controller: username,
//                 //   // label: 'Username',
//                 //   hintText: "username",
//                 //   color: Colors.white,
//                 //   border: 10,
//                 //   icon: Icons.person,
//                 //   validator: (value) {
//                 //     if (value!.isEmpty) {
//                 //       return 'Username is required';
//                 //     }
//                 //     if (value.length < 3) {
//                 //       return 'Username must be at least 3 characters';
//                 //     }
//                 //     if (value.length > 30) {
//                 //       return 'Username must not exceed 30 characters';
//                 //     }
//                 //     if (!RegExp(r'^[a-zA-Z0-9\.]+$').hasMatch(value)) {
//                 //       return 'Username must contain only alphanumeric characters and dots';
//                 //     }
//                 //     return null;
//                 //   },
//                 // ),
//                 CustomFormField(
//                   color: Colors.white70,
//                   hintText: "FullName",
//                   icon: Icons.person,
//                   border: 10,
//                   controller: fullname,
//                   validator: (value) {
//                     if (value?.isEmpty == true) {
//                       return 'Full Name is required';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 CustomFormField(
//                   color: Colors.white70,
//                   hintText: "Username",
//                   icon: Icons.person,
//                   border: 10,
//                   controller: username,
//                   validator: (value) {
//                     if (value?.isEmpty == true) {
//                       return 'Username is required';
//                     }
//                     if (value!.length < 3) {
//                       return 'Username must be at least 3 characters';
//                     }
//                     if (value.length > 30) {
//                       return 'Username must not exceed 30 characters';
//                     }
//                     if (!RegExp(r'^[a-zA-Z0-9\.]+$').hasMatch(value)) {
//                       return 'Username must contain only alphanumeric characters and dots';
//                     }
//                     return null;
//                   },
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 CustomFormField(
//                   color: Colors.white70,
//                   hintText: "Email Address",
//                   icon: Icons.email,
//                   border: 10,
//                   controller: email,
//                   validator: (value) {
//                     if (value?.isEmpty == true) {
//                       return 'Email is required';
//                     }
//                     // Add additional email validation if needed
//                     return null;
//                   },
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 CustomFormField(
//                   color: Colors.white70,
//                   hintText: "Password",
//                   icon: Icons.lock,
//                   border: 10,
//                   isPasswordField: true,
//                   controller: password,
//                   validator: (value) {
//                     if (value?.isEmpty == true) {
//                       return 'Password is required';
//                     }
//                     // Add additional password validation if needed
//                     return null;
//                   },
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 CustomFormField(
//                   color: Colors.white70,
//                   hintText: "Confirm Password",
//                   icon: Icons.lock,
//                   border: 10,
//                   isPasswordField: true,
//                   controller: confirmpass,
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Confirm Password is required';
//                     }
//                     if (value != password.text) {
//                       return 'Passwords do not match';
//                     }
//                     return null;
//                   },
//                 ),
//                 // ],
//                 // ),
//                 // ),
//                 SizedBox(height: 16),

//                 ElevatedButton(
//                   onPressed: () {
//                     debugPrint(
//                         "printtttttttttttttttt ${_formKey.currentState?.validate()}");
//                     if (_formKey.currentState!.validate() == true) {
//                       // Registration form is valid, perform desired action here
//                       // String fullName = _fullNameController.text;
//                       String namwe = username.text;
//                       // String email = _emailController.text;
//                       // String password = _passwordController.text;
//                       // String confirmPassword = _confirmPasswordController.text;
//                       // print('Full Name: $fullName');
//                       debugPrint('Username: $namwe');
//                       // print('Email: $email');
//                       // print('Password: $password');
//                       // print('Confirm Password: $confirmPassword');
//                     } else {
//                       debugPrint('Username:');
//                     }
//                   },
//                   child: Text('Register'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
