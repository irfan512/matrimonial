import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:us_muslim_match/config/theme.dart';
import 'package:us_muslim_match/screen/steps/widgets/question_five.dart';
import 'package:us_muslim_match/screen/steps/widgets/question_one.dart';
import 'package:us_muslim_match/utils/extensions.dart';
import 'package:us_muslim_match/utils/utils.dart';

import 'question_six.dart';
import 'widgets/question_four.dart';
import 'widgets/question_three.dart';
import 'widgets/question_two.dart';

class Steps extends StatefulWidget {
  const Steps({super.key});

  @override
  State<Steps> createState() => _StepsState();
}

class _StepsState extends State<Steps> {
  PageController _pageController = PageController();

  int indexValue = 0;
  List pages = [
    // QuestionOne(),
    QuestionTwo(),
    QuestionThree(),
    QuestionFour(),
    QuestionFive(),
    QuesstionSix(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 2.w),
          child: Stack(
            alignment: Alignment.center,
            children: [
              PageView.builder(
                controller: _pageController,
                scrollDirection: Axis.horizontal,
                onPageChanged: (value) {
                  setState(() {
                    indexValue = value;
                  });
                },
                itemCount: pages.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: pages[index],
                ),
              ),
              Positioned(
                bottom: 10,
                child: SmoothPageIndicator(
                  controller: _pageController, // PageController
                  count: pages.length,
                  effect: const JumpingDotEffect(
                      verticalOffset: 10,
                      activeDotColor: themeColor), // your preferred effect
                  // onDotClicked: (index) {
                  //   _pageController.jumpToPage(index);
                  //   log("index: $index");
                  // }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
