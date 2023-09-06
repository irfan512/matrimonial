import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:us_muslim_match/screen/profileUpdate/widgets/card_design.dart';
import 'package:us_muslim_match/screen/profileUpdate/widgets/question_three.dart';
import 'package:us_muslim_match/utils/extensions.dart';
import 'package:us_muslim_match/widgets/custom_text.dart';
import 'package:us_muslim_match/utils/utils.dart';

import '../../../config/colors.dart';

class QuestionTwo extends StatefulWidget {
  const QuestionTwo({super.key});

  @override
  State<QuestionTwo> createState() => _QuestionTwoState();
}

class _QuestionTwoState extends State<QuestionTwo> {
  final List<String> _list = [
    "122 cm  .  4'1\"",
    "124 cm  .  4'2\"",
    "127 cm  .  4'3\"",
    "130 cm  .  4'4\"",
    "130 cm  .  4'5\"",
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
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
          Center(
            child: InkWell(
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => QuestionThree()));
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
    );
  }
}
