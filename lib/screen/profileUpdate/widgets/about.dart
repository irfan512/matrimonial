import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:us_muslim_match/screen/landing_page.dart';
import 'package:us_muslim_match/utils/extensions.dart';

import '../../../config/colors.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/custom_textfield.dart';

class AboutPage extends StatefulWidget {
  List? selectedHobbies;
  String? sect;
  String? profile_pic;
  String? gender;
  String? relationship;
  String? height;
  String? marriagePlain;
  String? prayer;
  String? religious_you;
  String? cityid;
  String? countryid;
  String? stateid;
  String? convert;
  String? profession;
  AboutPage(
      {this.selectedHobbies,
      this.profession,
      this.sect,
      this.gender,
      this.convert,
      this.height,
      this.marriagePlain,
      this.prayer,
      this.profile_pic,
      this.relationship,
      this.religious_you,
      this.cityid,
      this.countryid,
      this.stateid});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {

  TextEditingController about =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customText("Bio",
                              fontWeight: FontWeight.w800, fontSize: 17.sp),
                          20.sh,

TextFormField(
cursorColor: Colors.black,
controller: about,
maxLines: null,
decoration: InputDecoration(
  hintText: "Tell us about yourself",
    focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black), // Bottom line color
            ),
),

),

//  CustomFormField(
//                               color: Colors.white70,
//                               hintText: "Tell us about yourself",
//                               // icon: Icons.lock,
//                               border: 0,
                            
//                               controller:about,
//                               validator: (value) {
//                                 if (value!.isEmpty) {
//                                   return 'Tell us about yourself';
//                                 }
//                                 // Add additional password validation if needed
//                                 return null;
//                               },
//                             ),

                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: InkWell(
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                      onTap: () {


                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BottomBarTab(
                                      // sect: widget.sect,
                                      // profession: widget.profession,
                                      // selectedHobbies: widget.selectedHobbies,
                                      // convert: widget.convert,
                                      // cityid: widget.cityid,
                                      // countryid: widget.countryid,
                                      // stateid: widget.stateid,
                                      // profile_pic: widget.profile_pic,
                                      // gender: widget.gender,
                                      // relationship: widget.relationship,
                                      // height: widget.height,
                                      // marriagePlain: widget.marriagePlain,
                                      // prayer: widget.prayer,
                                      // religious_you: widget.religious_you,
                                    )));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            border:
                                Border.all(color: ColorConstants.primaryColor)),
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
            )),
      ),
    );
  }
}
