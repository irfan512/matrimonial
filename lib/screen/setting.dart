import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:us_muslim_match/screen/auth/login.dart';
import 'package:us_muslim_match/screen/search_filter.dart';

import '../config/colors.dart';
import '../widgets/alert_service.dart';
import 'edit_profile.dart';
import 'landing_page.dart';



class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          "Settings",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: IconButton(
              icon: Icon(
                Icons.tune,
                color: ColorConstants.primaryColor,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchFilter()));
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EditProfile()));
              },
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.black,
                          backgroundImage:
                              AssetImage("assets/images/user1.jpg"),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Malena Veronica",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text("malena@gmail.com")
                          ],
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

            const SizedBox(
              height: 10,
            ),
            SettingsGroup(
              items: [
                SettingsItem(
                  onTap: () {},
                  icons: Icons.notifications,
                  iconStyle: IconStyle(),
                  title: 'Notifications',
                  subtitle: "Enable Notifications",
                ),
                SettingsItem(
                  onTap: () {},
                  icons: Icons.help_center,
                  iconStyle: IconStyle(
                    iconsColor: Colors.white,
                    withBackground: true,
                    backgroundColor: Colors.red,
                  ),
                  title: 'Help Center',
                  // subtitle: "",
                ),
                SettingsItem(
                  onTap: () {},
                  icons: Icons.support_agent,
                  iconStyle: IconStyle(
                    iconsColor: Colors.white,
                    withBackground: true,
                    backgroundColor: Colors.pink.shade200,
                  ),
                  title: 'Contact Support',
                  // subtitle: "",
                ),
                SettingsItem(
                  onTap: () {},
                  icons: Icons.privacy_tip,
                  iconStyle: IconStyle(
                    iconsColor: Colors.white,
                    withBackground: true,
                    backgroundColor: Colors.grey.shade500,
                  ),
                  title: 'Privacy Policy',
                  // subtitle: "",
                ),
              ],
            ),

            SettingsGroup(
              items: [
                SettingsItem(
                  onTap: () {},
                  icons: Icons.info_rounded,
                  iconStyle: IconStyle(
                    backgroundColor: Colors.purple,
                  ),
                  title: 'About',
                  subtitle: "Learn more about Ziar'App",
                ),
              ],
            ),
            // You can add a settings title
            SettingsGroup(
              settingsGroupTitle: "Account",
              items: [
                SettingsItem(
                  onTap: () {
    showDialog(
                        context: context,
                        builder: (context) {
                          return Alert(
                            onPressed: () {

                              selectedItemPosition = 0;
                              removeKey("token");
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Login()), (route) => false);
                           
                           
                           
                            },
                            maintext: "us muslim match",
                            text1:
                                'Are you sure you want to log out?',
                            textbutton1: 'Yes',
                            buttoncolor: Colors.red,
                             textbutton2: "Cancel",
                            onPressed2: (){
                              Navigator.pop(context);
                            },
                            buttoncolor2: Colors.black,
                          );
                        },
                      );


                  },
                  icons: Icons.exit_to_app_rounded,
                  title: "Sign Out",
                ),
                SettingsItem(
                  onTap: () {},
                  icons: CupertinoIcons.delete_solid,
                  title: "Delete account",
                  titleStyle: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }



  
}
