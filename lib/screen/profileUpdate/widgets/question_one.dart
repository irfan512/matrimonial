import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sizer/sizer.dart';
import 'package:us_muslim_match/screen/profileUpdate/widgets/card_design.dart';
import 'package:us_muslim_match/screen/profileUpdate/widgets/question_two.dart';
import 'package:us_muslim_match/widgets/custom_text.dart';
import 'package:us_muslim_match/utils/extensions.dart';
import 'package:us_muslim_match/utils/utils.dart';

import '../../../config/colors.dart';
import '../../../utils/images.dart';

class QuestionOne extends StatefulWidget {
 String? profile_pic;
  String?gender;
   QuestionOne({this.gender,this.profile_pic});

  @override
  State<QuestionOne> createState() => _QuestionOneState();
}

class _QuestionOneState extends State<QuestionOne> {
  final List<String> _list = [
    "Widowed",
    "Separated",
    "Divorced"
    "Never Married",
    "Married",
  ];
  String _selectedValue = '';
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
              // customText("Whats your material staus", fontSize: 10.sp,fontWeight: FontWeight.w600),
              Utils.heading("What's your marital status?"),
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
                if(_selectedValue!=''){
  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => QuestionTwo(
profile_pic:widget.profile_pic,
gender:widget.gender,
relationship:_list.indexOf(_selectedValue).toString()
                    )));
                }
              else{
                toast("Select Marital Status");
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
    );
  }
}
