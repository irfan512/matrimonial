import 'dart:convert';
import 'dart:developer';

import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sizer/sizer.dart';
import 'package:us_muslim_match/screen/profileUpdate/widgets/profile_image.dart';
import 'package:us_muslim_match/utils/extensions.dart';
import 'package:us_muslim_match/utils/utils.dart';
import 'package:us_muslim_match/widgets/custom_text.dart';

import '../../../config/colors.dart';
import '../../../model/get_site_setting.dart';
import 'about.dart';

class Questionten extends StatefulWidget {
   List? selectedHobbies;
   String?sect;
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
String?convert;
Questionten({this.selectedHobbies,this.sect,this.gender,this.convert,this.height,this.marriagePlain,this.prayer,this.profile_pic,this.relationship,this.religious_you,this.cityid,this.countryid,this.stateid});

  @override
  State<Questionten> createState() => _QuesstiontenState();
}

class _QuesstiontenState extends State<Questionten> {
  GetSiteSetting? sitedata;
  bool check = false;
  Future<void> getData() async {
    try {
      final cachedData = await getStringAsync('siteSettings');
      if (cachedData != null) {
        final siteSettings = GetSiteSetting.fromJson(jsonDecode(cachedData));

        sitedata = siteSettings;
        check = true;
        setState(() {});
        // Now you have access to the cached site settings data
        // log(siteSettings.sects![1].);
        // print(siteSettings.priorities);
        // ... and so on
      }
    } catch (error) {
      check = false;
      print('Error: $error');
    }
  }

  String? _selectedValue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: check == true
              ? Container(
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
                              customText("What's your Profession",
                                  fontWeight: FontWeight.w800, fontSize: 17.sp),
                              20.sh,
                              for (int i = 0;
                                  i < sitedata!.professions!.length;
                                  i++) ...[
                                Utils.customRadioTile(
                                    title: sitedata!.professions![i].name
                                        .toString(),
                                    value: sitedata!.professions![i].name
                                        .toString(),
                                    groupValue: _selectedValue,
                                    funtion: (value) {
                                      _selectedValue = value!;
                                      setState(() {});
                                    })
                              ]
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
                                    builder: (context) => AboutPage(

sect:_selectedValue,
profession:_selectedValue,
          selectedHobbies: widget.selectedHobbies,
convert:widget.convert,
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                border: Border.all(
                                    color: ColorConstants.primaryColor)),
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
                )
              : Center(
                  child: CircularProgressIndicator(
                    color: ColorConstants.primaryColor,
                  ),
                ),
        ),
      ),
    
    
    );
  }
}
