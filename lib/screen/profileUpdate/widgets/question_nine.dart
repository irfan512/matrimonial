import 'dart:convert';

import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sizer/sizer.dart';
import 'package:us_muslim_match/screen/profileUpdate/widgets/question_ten.dart';
import 'package:us_muslim_match/utils/extensions.dart';
import 'package:us_muslim_match/utils/utils.dart';
import 'package:us_muslim_match/widgets/custom_text.dart';

import '../../../config/colors.dart';
import '../../../model/get_site_setting.dart';

class QuesstionNine extends StatefulWidget {
  List selectedHobbies;

  QuesstionNine({required this.selectedHobbies});

  @override
  State<QuesstionNine> createState() => _QuesstionNineState();
}

class _QuesstionNineState extends State<QuesstionNine> {
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

    log("eeeeeeeeeeeeeeeeeeeeee ${widget.selectedHobbies[1]}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: check == true
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customText("What's your Sect",
                            fontWeight: FontWeight.w800, fontSize: 17.sp),
                        20.sh,
                        for (int i = 0; i < sitedata!.sects!.length; i++) ...[
                          Utils.customRadioTile(
                              title: sitedata!.sects![i].castName.toString(),
                              value: sitedata!.sects![i].castName.toString(),
                              groupValue: _selectedValue,
                              funtion: (value) {
                                _selectedValue = value!;
                                setState(() {});
                              })
                        ]
                      ],
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
                              builder: (context) => Questionten(),
                            ),
                          );
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
