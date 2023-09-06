import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:us_muslim_match/screen/profileUpdate/widgets/card_design.dart';
import 'package:us_muslim_match/screen/profileUpdate/widgets/profile_image.dart';
import 'package:us_muslim_match/screen/profileUpdate/widgets/question_one.dart';
import 'package:us_muslim_match/screen/profileUpdate/widgets/question_two.dart';
import 'package:us_muslim_match/widgets/custom_text.dart';
import 'package:us_muslim_match/utils/extensions.dart';
import 'package:us_muslim_match/utils/utils.dart';

import '../../../config/colors.dart';
import '../../../utils/images.dart';

class Gender extends StatefulWidget {
  const Gender({super.key});

  @override
  State<Gender> createState() => GenderState();
}

class GenderState extends State<Gender> {
  String gen_sel = "";
  final List<String> _list = [
    "Male",
    "Female",
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              20.sh,
              Utils.heading("What's your Gender "),
              30.sh,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          gen_sel = "male";
                          setState(() {});
                        },
                        child: Container(
                          height: 130,
                          width: MediaQuery.of(context).size.width * .34,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: gen_sel == "male"
                                      ? Colors.green
                                      : Colors.white),
                              image: const DecorationImage(
                                  image: AssetImage("assets/male.png"),
                                  fit: BoxFit.contain)),
                        ),
                      ),
                      10.sh,
                      customText("Male",
                          fontSize: 16, fontWeight: FontWeight.w500)
                    ],
                  ),
                  10.sw,
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          gen_sel = "female";
                          setState(() {});
                        },
                        child: Container(
                          height: 130,
                          width: MediaQuery.of(context).size.width * .34,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: gen_sel == "female"
                                      ? Colors.green
                                      : Colors.white),
                              image: const DecorationImage(
                                  image: AssetImage("assets/female.png"),
                                  fit: BoxFit.contain)),
                        ),
                      ),
                      10.sh,
                      customText("Female",
                          fontSize: 16, fontWeight: FontWeight.w500)
                    ],
                  )
                ],
              ),

              // for (int i = 0; i < _list.length; i++) ...[
              //   Utils.customRadioTile(
              //       title: _list[i],
              //       value: _list[i],
              //       groupValue: _selectedValue,
              //       funtion: (value) {
              //         _selectedValue = value!;
              //         setState(() {});
              //       })
              // ],
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
                    MaterialPageRoute(builder: (context) => QuestionOne()));
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
