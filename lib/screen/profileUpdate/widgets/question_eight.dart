import 'dart:convert';
import 'dart:developer' as log;

import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sizer/sizer.dart';
import 'package:us_muslim_match/screen/profileUpdate/widgets/question_nine.dart';
import 'package:us_muslim_match/utils/extensions.dart';
import 'package:us_muslim_match/utils/utils.dart';
import 'package:us_muslim_match/widgets/custom_text.dart';

import '../../../config/colors.dart';
import '../../../model/get_site_setting.dart';

class QuestionEight extends StatefulWidget {
  @override
  State<QuestionEight> createState() => _QuestionEightState();
}

class _QuestionEightState extends State<QuestionEight> {
  GetSiteSetting? sitedata;
  bool check = false;
  Future<void> getData() async {
    try {
      final cachedData = await getStringAsync('siteSettings');
      if (cachedData != null) {
        final siteSettings = GetSiteSetting.fromJson(jsonDecode(cachedData));

        sitedata = siteSettings;
        check = true;
        setState(() {});
        // Now you have access to the cached site settings data
        // log(siteSettings.sects![1].);
        // print(siteSettings.priorities);
        // ... and so on
      }
    } catch (error) {
      check = false;
      print('Error: $error');
    }
  }

  String? _selectedValue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getData();
  }

  List selectedHobbies = [];
  void toggleHobbySelection(String hobby) {
    setState(() {
      if (selectedHobbies.contains(hobby)) {
        selectedHobbies.remove(hobby);
      } else {
        selectedHobbies.add(hobby);
      }
    });
  }

  bool isHobbySelected(String hobby) {
    return selectedHobbies.contains(hobby);
  }


  void _navigateToNextScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuesstionNine(selectedHobbies: selectedHobbies),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customText("What are your Interests?",
                  fontWeight: FontWeight.w800, fontSize: 17.sp),
              20.sh,
              Expanded(
                child: SingleChildScrollView(
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      for (int i = 0; i < sitedata!.interests!.length; i++) ...[
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: InkWell(
                            onTap: () {
                              toggleHobbySelection(sitedata!.interests![i].id!);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: isHobbySelected(
                                          sitedata!.interests![i].id!)
                                      ? Colors.white
                                      : ColorConstants.primaryColor,
                                ),
                                color:
                                    isHobbySelected(sitedata!.interests![i].id!)
                                        ? Colors.black
                                        : Colors.white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  sitedata!.interests![i].name!,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: isHobbySelected(
                                              sitedata!.interests![i].id!)
                                          ? Colors.white
                                          : ColorConstants.primaryColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13),
                                ),
                              ),
                            ),
                          ),
                        )
                      ]
                    ],
                  ),
                ),
              ),
              Center(
                child: InkWell(
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  onTap: _navigateToNextScreen,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        border: Border.all(color: ColorConstants.primaryColor)),
                    height: 45,
                    width: 210,
                    child: const Center(
                      child: Text(
                        'Continue',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
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

class NextScreen extends StatelessWidget {
  List selectedHobbies;

  NextScreen({required this.selectedHobbies});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selected Hobbies'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Selected Hobbies:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Column(
              children: [
                for (int i = 0; i < selectedHobbies.length; i++) ...[
                  Text(selectedHobbies[i]),
                ]
              ],
            ),
          ],
        ),
      ),
    );
  }
}
