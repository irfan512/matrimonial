import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sizer/sizer.dart';
import 'package:us_muslim_match/screen/profileUpdate/widgets/card_design.dart';
import 'package:us_muslim_match/screen/profileUpdate/widgets/gender.dart';
import 'package:us_muslim_match/screen/profileUpdate/widgets/question_two.dart';
import 'package:us_muslim_match/widgets/custom_text.dart';
import 'package:us_muslim_match/utils/extensions.dart';
import 'package:us_muslim_match/utils/utils.dart';
import 'package:image_picker/image_picker.dart';
import '../../../config/colors.dart';
import '../../../utils/images.dart';

class CoverImage extends StatefulWidget {
  const CoverImage({super.key});

  @override
  State<CoverImage> createState() => CoverImageState();
}

class CoverImageState extends State<CoverImage> {
  File? profilepic;
  Future profilePhoto(type) async {
    var pic;
    if (type == "camera") {
      pic = await ImagePicker().pickImage(source: ImageSource.camera);
    } else {
      pic = await ImagePicker().pickImage(source: ImageSource.gallery);
    }
    if (pic != null) {
      setState(() {
        profilepic = File(pic.path);
      });
    }
  }

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              20.sh,
              // customText("Whats your material staus", fontSize: 10.sp,fontWeight: FontWeight.w600),
              Utils.heading("Attach Your Full Face Picture"),
              30.sh,
              Center(
                child: Stack(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  children: [
                    profilepic != null
                        ? PhysicalModel(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                            elevation: 1,
                            child: Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade500,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.grey.shade400,
                                  ),
                                  image: DecorationImage(
                                      image: FileImage(profilepic!))),
                            ),
                          )
                        : PhysicalModel(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                            elevation: 1,
                            child: Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade500,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.grey.shade400,
                                ),
                              ),
                            ),
                          ),
                    Positioned(
                      bottom: -0,
                      right: -0,
                      child: GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      height: 5.0,
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.5),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    ),
                                    InkWell(
                                        onTap: () {
                                          profilePhoto("camera");
                                          Navigator.pop(context);
                                        },
                                        child: const ListTile(
                                          leading: Icon(Icons.camera_alt),
                                          title: Text("Open Camera"),
                                        )),
                                    InkWell(
                                        onTap: () {
                                          profilePhoto("gallery");
                                          Navigator.pop(context);
                                        },
                                        child: const ListTile(
                                          leading: Icon(Icons.photo),
                                          title: Text("Open Gallery"),
                                        )),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              shape: BoxShape.circle),
                          child: const Center(
                              child: Icon(
                            Icons.add_a_photo,
                            size: 22,
                          )),
                        ),
                      ),
                    )
                  ],
                ),
              )
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
                  profilepic!=null
                ){
 Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Gender(profile_pic:profilepic!.path)));
                }else{
toast("Select Profile Picture");
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
