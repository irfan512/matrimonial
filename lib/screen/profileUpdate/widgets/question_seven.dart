import 'dart:developer';

import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:us_muslim_match/screen/profileUpdate/widgets/question_eight.dart';
import 'package:us_muslim_match/utils/extensions.dart';
import 'package:us_muslim_match/utils/utils.dart';
import 'package:us_muslim_match/widgets/custom_text.dart';

import '../../../config/colors.dart';

class QuesstionSeven extends StatefulWidget {

String?profile_pic;
String?gender;
String?relationship;
String?height;
String?marriagePlain;
String?prayer;
String?religious_you;
String?cityid;
String?countryid;
String?stateid;

QuesstionSeven({this.gender,this.height,this.marriagePlain,this.prayer,this.profile_pic,this.relationship,this.religious_you,this.cityid,this.countryid,this.stateid});
  @override
  State<QuesstionSeven> createState() => _QuesstionSevenState();
}

class _QuesstionSevenState extends State<QuesstionSeven> {
  final List<String> _list = ["Yes", "No"];
  String _selectedValue = '';
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
                  customText("Are you a Convert/Revert",
                      fontWeight: FontWeight.w800, fontSize: 17.sp),
                  20.sh,
                  for (int i = 0; i < _list.length; i++) ...[
                    Utils.customRadioTile(
                        title: _list[i],
                        value: _list[i],
                        groupValue: _selectedValue,
                        funtion: (value) {
                          _selectedValue = value!;
                          setState(() {});
                        })
                  ],
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
                            builder: (context) => QuestionEight(
convert:_selectedValue,
 cityid: widget.cityid,
                                            countryid: widget.countryid,
                                            stateid: widget.stateid,
                                            profile_pic: widget.profile_pic,
                                            gender: widget.gender,
                                            relationship: widget.relationship,
                                            height: widget.height,
                                            marriagePlain: widget.marriagePlain,
                                            prayer: widget.prayer,
                                            religious_you: widget.religious_you,

                            )));
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
