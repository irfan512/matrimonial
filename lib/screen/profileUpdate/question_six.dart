import 'dart:convert';
import 'dart:developer';

import 'package:country_list_pick/country_list_pick.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sizer/sizer.dart';
import 'package:us_muslim_match/screen/profileUpdate/widgets/question_seven.dart';
import 'package:us_muslim_match/utils/extensions.dart';
import 'package:us_muslim_match/utils/utils.dart';
import 'package:us_muslim_match/widgets/custom_text.dart';

import '../../config/app_constant.dart';
import '../../config/colors.dart';
import '../../model/city_model.dart';
import '../../model/get_site_setting.dart';

class QuesstionSix extends StatefulWidget {
  String? profile_pic;
  String? gender;
  String? relationship;
  String? height;
  String? marriagePlain;
  String? prayer;
  String? religious_you;
  QuesstionSix(
      {this.gender,
      this.height,
      this.marriagePlain,
      this.prayer,
      this.profile_pic,
      this.relationship,
      this.religious_you});

  @override
  State<QuesstionSix> createState() => _QuesstionSixState();
}

class _QuesstionSixState extends State<QuesstionSix> {
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
          child: check == true
              ? Padding(
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
                                20.sh,
                                Utils.heading("Select Your Country"),
                                for (int i = 0;
                                    i < sitedata!.countries!.length;
                                    i++) ...[
                                  Utils.customRadioTile(
                                      title: sitedata!.countries![i].name!,
                                      value: sitedata!.countries![i].id,
                                      groupValue: _selectedValue,
                                      funtion: (value) {
                                        _selectedValue = value;
                                        log(_selectedValue);
                                        setState(() {});
                                      }),
                                ],
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
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
                                      builder: (context) => SelectState(
                                            id: _selectedValue,
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
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(
                    color: ColorConstants.primaryColor,
                  ),
                )),
    );
  }
}

class SelectState extends StatefulWidget {
  String? id;
  String? profile_pic;
  String? gender;
  String? relationship;
  String? height;
  String? marriagePlain;
  String? prayer;
  String? religious_you;
  SelectState(
      {this.gender,
      this.id,
      this.height,
      this.marriagePlain,
      this.prayer,
      this.profile_pic,
      this.relationship,
      this.religious_you});

  @override
  State<SelectState> createState() => _SelectStateState();
}

class _SelectStateState extends State<SelectState> {
  bool? check;
  List<City>? states = [];
  void selectState(id) async {
    // Create a Dio instance
    Dio dio = Dio();
    // Define the query parameters as a Map
    Map<String, dynamic> queryParams = {
      'country_id': id,
    };
    try {
      // Send a GET request with query parameters
      Response response = await dio.get(
        AppConstant.apiPath + 'get-states', // Replace with your API endpoint
        queryParameters: queryParams,
        options: Options(
          headers: {
            "Authorization":
                "Bearer ea9b37dc82d5d5e1eb0efe5f6f0086bacda8381853ae6606b6affd61173c907a",
            // "Content-Type": "application/json",
            // "Authorization":
            // "Bearer ",
            // "Token": "${getStringAsync("token")}",
          },
        ),
      );

      print(response.data);
      // Handle the response
      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = response.data;
        if (responseData[AppConstant.apiStatus] == 200) {
          // Data retrieval successful
          List<dynamic> jsonData = responseData['data'];
          states = jsonData.map((user) {
            return City.fromJson(user);
          }).toList();
          check = true;
          setState(() {});
        }
      } else {
        // Handle error responses
        toast('Request failed with status: ${response.statusCode}');
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      // Handle network or other errors
      toast('Error: $error');
      print('Error: $error');
    }
  }

  String? _selectedValue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectState(widget.id);
    log("country idddddddddddd${widget.id}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: check == true
              ? Padding(
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
                                20.sh,
                                Utils.heading("Select Your State"),
                                for (int i = 0; i < states!.length; i++) ...[
                                  Utils.customRadioTile(
                                      title: states![i].stateName,
                                      value: states![i].stateid,
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
                        SizedBox(
                          height: 10,
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
                                      builder: (context) => SelectCity(
                                            stateid: _selectedValue,
                                            countryid: widget.id,
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
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(
                    color: ColorConstants.primaryColor,
                  ),
                )),
    );
  }
}

class SelectCity extends StatefulWidget {
  String? stateid;
  String? countryid;
  // String? id;
  String? profile_pic;
  String? gender;
  String? relationship;
  String? height;
  String? marriagePlain;
  String? prayer;
  String? religious_you;
  SelectCity(
      {this.gender,
      // this.id,
      this.stateid,
      this.countryid,
      this.height,
      this.marriagePlain,
      this.prayer,
      this.profile_pic,
      this.relationship,
      this.religious_you});
  @override
  State<SelectCity> createState() => _SelectCityState();
}

class _SelectCityState extends State<SelectCity> {
  bool? check;
  List<City>? states = [];

 void selectCity() async {
    // Create a Dio instance
    Dio dio = Dio();
    // Define the query parameters as a Map
    Map<String, dynamic> queryParams = {
      'country_id': widget.countryid,
      'state_id': widget.stateid,
    };
    try {
      // Send a GET request with query parameters
      Response response = await dio.get(
        AppConstant.apiPath + 'get-cities', // Replace with your API endpoint
        queryParameters: queryParams,
        options: Options(
          headers: {
            "Authorization":
                "Bearer ea9b37dc82d5d5e1eb0efe5f6f0086bacda8381853ae6606b6affd61173c907a",
            // "Content-Type": "application/json",
            // "Authorization":
            // "Bearer ",
            // "Token": "${getStringAsync("token")}",
          },
        ),
      );

      print(response.data);
      // Handle the response
      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = response.data;
        if (responseData[AppConstant.apiStatus] == 200) {
          // Data retrieval successful
          List<dynamic> jsonData = responseData['data'];
          states = jsonData.map((user) {
            return City.fromJson(user);
          }).toList();
          check = true;
          setState(() {});
        }
      } else {
        // Handle error responses
        toast('Request failed with status: ${response.statusCode}');
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      // Handle network or other errors
      toast('Error: $error');
      print('Error: $error');
    }
  }
  String? _selectedValue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectCity();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: check == true
              ? Padding(
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
                                20.sh,
                                Utils.heading("Select Your City"),
                                for (int i = 0; i < states!.length; i++) ...[
                                  Utils.customRadioTile(
                                      title: states![i].cityName,
                                      value: states![i].cityId,
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
                        SizedBox(
                          height: 10,
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
                                      builder: (context) => QuesstionSeven(
                                            cityid: _selectedValue,
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
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(
                    color: ColorConstants.primaryColor,
                  ),
                )),
    );
  }
}
