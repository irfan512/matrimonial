import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sizer/sizer.dart';
import 'package:us_muslim_match/screen/profileUpdate/widgets/question_five.dart';
import 'package:us_muslim_match/utils/utils.dart';
import 'package:us_muslim_match/widgets/custom_text.dart';
import 'package:us_muslim_match/utils/extensions.dart';

import '../../../config/colors.dart';

class QuestionFour extends StatefulWidget {
 String?profile_pic;
String?gender;
String?relationship;
String?height;
String?marriagePlain;
   QuestionFour({this.gender,this.height,this.marriagePlain,this.profile_pic,this.relationship});

  @override
  State<QuestionFour> createState() => _QuestionFourState();
}

class _QuestionFourState extends State<QuestionFour> {
  final List<String> _list = [
    "Always pray",
    "Usually pray",
    "Sometimes pray",
    "Never pray",
  ];
  String _selectedValue = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Utils.heading("How often do you pray?"),
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

                  // customText("Always pray",
                  //     fontSize: 17,
                  //     fontWeight: FontWeight.w500,
                  //     textColor: Colors.grey.shade700),
                  // 20.sh,
                  // customText("Usually pray",
                  //     fontSize: 17,
                  //     fontWeight: FontWeight.w500,
                  //     textColor: Colors.grey.shade700),
                  // 20.sh,
                  // customText("Sometimes pray",
                  //     fontSize: 17,
                  //     fontWeight: FontWeight.w500,
                  //     textColor: Colors.grey.shade700),
                  // 20.sh,
                  // customText("Never pray",
                  //     fontSize: 17,
                  //     fontWeight: FontWeight.w500,
                  //     textColor: Colors.grey.shade700),
                ],
              ),
              Center(
                child: InkWell(
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  onTap: () {
                    if(
                      _selectedValue!=''
                    ){
 Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => QuestionFive(

profile_pic:widget.profile_pic,
gender:widget.gender,
relationship:widget.relationship,
height:widget.height,
marriagePlain:widget.marriagePlain,
prayer:_selectedValue,
                            )));
                    }
                    else{
                      toast("Select Prayers");
                    }
                   
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
