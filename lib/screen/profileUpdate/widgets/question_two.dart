import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:us_muslim_match/screen/profileUpdate/widgets/card_design.dart';
import 'package:us_muslim_match/screen/profileUpdate/widgets/question_three.dart';
import 'package:us_muslim_match/utils/extensions.dart';
import 'package:us_muslim_match/widgets/custom_text.dart';
import 'package:us_muslim_match/utils/utils.dart';

import '../../../config/colors.dart';

class QuestionTwo extends StatefulWidget {
  String?profile_pic;
  String?gender;
  String?relationship;
  QuestionTwo({this.gender,this.profile_pic,this.relationship});

  @override
  State<QuestionTwo> createState() => _QuestionTwoState();
}

class _QuestionTwoState extends State<QuestionTwo> {
  final List<String> _list = [
    "124 cm  .  4'1\"",
    "127 cm  .  4'2\"",
    "130 cm  .  4'3\"",
    "132 cm  .  4'4\"",
    "135 cm  .  4'5\"",
    "137 cm  .  4'6\"",
    "140 cm  .  4'7\"",
    "142 cm  .  4'8\"",
    "145 cm  .  4'9\"",
    "147 cm  .  4'10\"",
    "150 cm  .  4'11\"",
    "152 cm  .  5'0\"",
    "155 cm  .  5'1\"",
    "157 cm  .  5'2\"",
    "160 cm  .  5'3\"",
    "163 cm  .  5'4\"",
    "165 cm  .  5'5\"",
    "167 cm  .  5'6\"",
    "170 cm  .  5'7\"",
    "173 cm  .  5'8\"",
    "175 cm  .  5'9\"",
    "178 cm  .  5'10\"",
    "180 cm  .  5'11\"",
    "183 cm  .  6'0\"",
    "185 cm  .  6'1\"",
    "187 cm  .  6'2\"",
    "190 cm  .  6'3\"",
    "193 cm  .  6'4\"",
    "196 cm  .  6'5\"",
    "198 cm  .  6'6\"",
    "201 cm  .  6'7\"",
    "203 cm  .  6'8\"",
  ];
  String _selectedValue = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CardDesign(
      widget: _widget(),
    ));
  }

  Widget _widget() {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    20.sh,
                    Utils.heading("How tall are you?"),
                    for (int i = 0; i < _list.length; i++) ...[
                      Utils.customRadioTile(
                          title: _list[i],
                          value: _list[i],
                          groupValue: _selectedValue,
                          funtion: (value) {
                            _selectedValue = value!;
                            setState(() {});
                          }),
                    ],
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Center(
              child: InkWell(
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => QuestionThree(
      profile_pic:widget.profile_pic,
      gender:widget.gender,
      relationship:widget.relationship,
                        height:_selectedValue,
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
    );
  }
}
