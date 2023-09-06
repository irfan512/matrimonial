import 'dart:developer';

import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:us_muslim_match/screen/profileUpdate/widgets/question_seven.dart';
import 'package:us_muslim_match/utils/extensions.dart';
import 'package:us_muslim_match/utils/utils.dart';
import 'package:us_muslim_match/widgets/custom_text.dart';

import '../../config/colors.dart';

class QuesstionSix extends StatelessWidget {
  const QuesstionSix({super.key});

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
                  customText("What's your ethnic origin",
                      fontWeight: FontWeight.w800, fontSize: 17.sp),
                  20.sh,
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .8,
                    child: CountryListPick(
                        appBar: AppBar(
                          leading: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                color: Colors.black,
                              )),
                          backgroundColor: Colors.white,
                          title: customText("Select country"),
                          elevation: 0,
                        ),

                        // if you need custome picker use this

                        // To disable option set to false

                        theme: CountryTheme(
                          labelColor: Colors.black,
                          alphabetSelectedTextColor: Colors.black,
                          isShowFlag: true,
                          isShowTitle: true,
                          // isShowCode: true,
                          isDownIcon: true,
                          showEnglishName: true,
                        ),
                        // Set default value
                        initialSelection: 'PK',
                        // or
                        // initialSelection: 'US'
                        onChanged: (CountryCode? code) {
                          log(code!.name.toString());
                          log(code.code.toString());
                          log(code.dialCode.toString());
                          log(code.flagUri.toString());
                        },

                        // Whether to p the widget to set a custom UI overlay
                        useUiOverlay: true,
                        // Whether the country list should be wrapped in a SafeArea
                        useSafeArea: false),
                  ),
                ],
              ),
              Center(
                child: InkWell(
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QuesstionSeven()));
                  },
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
