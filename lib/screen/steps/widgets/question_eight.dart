import 'dart:developer';

import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:us_muslim_match/screen/steps/widgets/question_nine.dart';
import 'package:us_muslim_match/utils/extensions.dart';
import 'package:us_muslim_match/utils/utils.dart';
import 'package:us_muslim_match/widgets/custom_text.dart';

import '../../../config/colors.dart';

class QuestionEight extends StatefulWidget {
  final List hobbies = [
    'Reading',
    'Running',
    'Cooking',
    'Painting',
    'Gaming',
  ];
  @override
  State<QuestionEight> createState() => _QuestionEightState();
}

class _QuestionEightState extends State<QuestionEight> {
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customText("What are your Interests?",
                      fontWeight: FontWeight.w800, fontSize: 17.sp),
                  20.sh,
                  Wrap(
                    children: [
                      for (int i = 0; i < widget.hobbies.length; i++) ...[
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              toggleHobbySelection(widget.hobbies[i]);
                            },
                            child: Container(
                              height: 40,
                              width: 90,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: isHobbySelected(widget.hobbies[i])
                                      ? Colors.white
                                      : ColorConstants.primaryColor,
                                ),
                                color: isHobbySelected(widget.hobbies[i])
                                    ? Colors.black
                                    : Colors.white,
                              ),
                              child: Center(
                                  child: Text(
                                widget.hobbies[i],
                                style: TextStyle(
                                  color: isHobbySelected(widget.hobbies[i])
                                      ? Colors.white
                                      : ColorConstants.primaryColor,
                                ),
                              )),
                            ),
                          ),
                        )
                      ]
                    ],
                  ),
                ],
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
