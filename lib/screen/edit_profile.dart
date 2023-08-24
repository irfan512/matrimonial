import 'package:flutter/material.dart';

import '../config/colors.dart';


class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text('Edit Profile',
            style: TextStyle(
                color: ColorConstants.primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: ColorConstants.primaryColor,
            size: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
          child: Column(
            children: [
              Center(
                child: Stack(
                  children: [
                    // profilepic == null && data2!.user!.photo == ""
                    // ?
                    Container(
                      height: 140,
                      width: 140,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.black12),
                      child: const Center(
                          child: Icon(
                        Icons.person_sharp,
                        size: 55,
                        color: Colors.white,
                      )),
                    ),
                    // : profilepic != null
                    //     ? Container(
                    //         height: 140,
                    //         width: 140,
                    //         decoration: BoxDecoration(
                    //           color: Colors.grey.withOpacity(0.3),
                    //           shape: BoxShape.circle,
                    //           image: DecorationImage(
                    //               image: FileImage(profilepic!),
                    //               fit: BoxFit.fitWidth),
                    //         ),
                    //       ),
                    // : InkWell(
                    //       onTap: (){
                    //         // Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailScreen(image: data2!
                    //         //             .user!.photo,)));
                    //       },
                    //   child: Container(
                    //       height: 140,
                    //       width: 140,
                    //       decoration: BoxDecoration(
                    //         color: Colors.grey.withOpacity(0.3),
                    //         shape: BoxShape.circle,
                    //         image: DecorationImage(
                    //             image: NetworkImage(
                    //                 data2!.user!.photo!),
                    //             fit: BoxFit.fitWidth),
                    //       ),
                    //     ),
                    // ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            // profilePhoto();
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                color: ColorConstants.primaryColor,
                                shape: BoxShape.circle),
                            child: const Icon(
                              Icons.camera_alt_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ))
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text('About me',
                        style: TextStyle(
                            color: ColorConstants.primaryColor,
                            fontSize: 22,
                            fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 0.0),
                  const ListTile(
                    title: Text(
                      "Full Name",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                    subtitle: Text("irfan"),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    ),
                  ),
                  Divider(
                    color: Colors.black12,
                  ),
                  const ListTile(
                    title: Text(
                      "Date of birth",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                    subtitle: Text(
                      "shia",
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    ),
                  ),
                  Divider(
                    color: Colors.black12,
                  ),
                  const ListTile(
                    title: Text(
                      "Gender",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                    subtitle: Text("male"),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    ),
                  ),
                  Divider(
                    color: Colors.black12,
                  ),
                  const ListTile(
                    title: Text(
                      "Height",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                    subtitle: Text("male"),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    ),
                  ),
                  Divider(
                    color: Colors.black12,
                  ),
                  const ListTile(
                    title: Text(
                      "Marital Status",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                    subtitle: Text("male"),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    ),
                  ),
                  Divider(
                    color: Colors.black12,
                  ),
                  const ListTile(
                    title: Text(
                      "Children",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                    subtitle: Text("male"),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    ),
                  ),
                  Divider(
                    color: Colors.black12,
                  ),
                  const ListTile(
                    title: Text(
                      "About me",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                    subtitle: Text("nothing"),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text('Future Plans',
                        style: TextStyle(
                            color: ColorConstants.primaryColor,
                            fontSize: 22,
                            fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 0.0),
                  const ListTile(
                    title: Text(
                      "Marriage plans",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                    subtitle: Text("marriage within a year"),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    ),
                  ),
                  Divider(
                    color: Colors.black12,
                  ),
                  const ListTile(
                    title: Text(
                      "Relocation plans",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                    subtitle: Text(
                      "Won't move abroad",
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    ),
                  ),
                  Divider(
                    color: Colors.black12,
                  ),
                  const ListTile(
                    title: Text(
                      "Family plans",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                    subtitle: Text("wants children"),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text('Education and career',
                        style: TextStyle(
                            color: ColorConstants.primaryColor,
                            fontSize: 22,
                            fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 0.0),
                  const ListTile(
                    title: Text(
                      "Profession",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                    subtitle: Text("Air Hostess"),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    ),
                  ),
                  const Divider(
                    color: Colors.black12,
                  ),
                  const ListTile(
                    title: Text(
                      "Education",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                    subtitle: Text(
                      "High school",
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    ),
                  ),
                  const Divider(
                    color: Colors.black12,
                  ),
                  const ListTile(
                    title: Text(
                      "Job tilte",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                    subtitle: Text("no job"),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text('Languages and ethnicity',
                        style: TextStyle(
                            color: ColorConstants.primaryColor,
                            fontSize: 22,
                            fontWeight: FontWeight.bold)),
                  ),
                  const ListTile(
                    title: Text(
                      "Ethnic group",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                    subtitle: Text(
                      "Pakistan",
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    ),
                  ),
                  const Divider(
                    color: Colors.black12,
                  ),
                  const ListTile(
                    title: Text(
                      "Languages",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                    subtitle: Text("complete profile"),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Text('Religious practice',
                        style: TextStyle(
                            color: ColorConstants.primaryColor,
                            fontSize: 22,
                            fontWeight: FontWeight.bold)),
                  ),
                  const ListTile(
                    title: Text(
                      "Convert/Revert",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                    subtitle: Text(
                      "No",
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    ),
                  ),
                  const Divider(
                    color: Colors.black12,
                  ),
                  const ListTile(
                    title: Text(
                      "Sect",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                    subtitle: Text("shia"),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    ),
                  ),
                  const Divider(
                    color: Colors.black12,
                  ),
                  const ListTile(
                    title: Text(
                      "Alcohol",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                    subtitle: Text("doesn't drink"),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    ),
                  ),
                  const Divider(
                    color: Colors.black12,
                  ),
                  const ListTile(
                    title: Text(
                      "Smoking",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                    subtitle: Text("No"),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    ),
                  ),
                  const Divider(
                    color: Colors.black12,
                  ),
                  const ListTile(
                    title: Text(
                      "Diet",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                    subtitle: Text("Only eats Halal"),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
