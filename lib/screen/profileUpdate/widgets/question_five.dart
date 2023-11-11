import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:us_muslim_match/screen/profileUpdate/question_six.dart';
import 'package:us_muslim_match/widgets/custom_text.dart';
import 'package:us_muslim_match/utils/extensions.dart';

import '../../../config/colors.dart';
import '../../../utils/utils.dart';

class QuestionFive extends StatefulWidget {
  String?profile_pic;
String?gender;
String?relationship;
String?height;
String?marriagePlain;
String?prayer;
   QuestionFive({this.gender,this.height,this.marriagePlain,this.prayer,this.profile_pic,this.relationship});

  @override
  State<QuestionFive> createState() => _QuestionFiveState();
}

class _QuestionFiveState extends State<QuestionFive> {
  final List<String> _list = [
    "Very practising",
    "Practising",
    "Moderately practising",
    "Not practising",
  ];
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
                  Utils.heading("How religious are you?"),
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QuesstionSix(
profile_pic:widget.profile_pic,
gender:widget.gender,
relationship:widget.relationship,
height:widget.height,
marriagePlain:widget.marriagePlain,
prayer:widget.prayer,        
religious_you:_selectedValue,
                            )
                            ));
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
