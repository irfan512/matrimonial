import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:us_muslim_match/provider/blocked_provider.dart';
import 'package:us_muslim_match/screen/search_filter.dart';

import '../../config/colors.dart';
import '../../provider/random_user_provider.dart';
import '../../widgets/alert_service.dart';
import '../../widgets/profile_card.dart';
import '../explore/explore.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ProfileCard> profile = [];
  List<String> images = [
    'assets/images/user1.jpg',
    'assets/images/user7.png',
    'assets/images/user2.jpg',
    'assets/images/user3.jpg',
    'assets/images/user4.jpg',
    'assets/images/user5.jpeg',
    'assets/images/user6.png',
  ];

  @override
  void initState() {
    super.initState();
    context.read<RandomUserProvider>().randomUserData(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('For You',
            style: TextStyle(
                color: ColorConstants.primaryColor,
                fontSize: 28,
                fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: Icon(
            Icons.tune,
            color: ColorConstants.primaryColor,
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SearchFilter()));
          },
        ),
        // actions: [
        //   IconButton(
        //     icon: Icon(
        //       Icons.settings,
        //       color: ColorConstants.primaryColor,
        //     ),
        //     onPressed: () {
        //       Navigator.push(
        //           context, MaterialPageRoute(builder: (context) => Explore()));
        //     },
        //   ),
        // ],
      ),
      body: Consumer<RandomUserProvider>(builder: (context, value, child) {
        return value.check == true
            ? Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .8,
                          width: MediaQuery.of(context).size.width,
                          child: Stack(
                            children: [
                              ProfileCard(
                                  image: 'assets/images/user1.jpg',
                                  name:
                                      "${value.randomuser[value.currentIndex].firstName.toString()} ${value.randomuser[value.currentIndex].lastName.toString()}"),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, top: 20, bottom: 70),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                      "${value.randomuser[value.currentIndex].firstName.toString()} ${value.randomuser[value.currentIndex].lastName.toString()}",
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w500,
                                          color: ColorConstants.secondary)),
                                  const SizedBox(width: 10),
                                  Container(
                                    width: 10,
                                    height: 10,
                                    decoration: BoxDecoration(
                                      color: ColorConstants.active,
                                      shape: BoxShape.circle,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              // name and location
                              Text('Fashion Designer at Victoria Secret',
                                  style: TextStyle(
                                      color: ColorConstants.secondary,
                                      fontSize: 16)),
                              const SizedBox(
                                height: 8,
                              ),
                              Text('69m away',
                                  style: TextStyle(
                                      color: ColorConstants.secondary,
                                      fontSize: 16)),
                              const SizedBox(
                                height: 32,
                              ),
                              Text('ABOUT ME',
                                  style: TextStyle(
                                      color: ColorConstants.secondary,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500)),
                              const SizedBox(
                                height: 8,
                              ),
                              // about
                              Text(
                                  'Hey guys, This is Malena. I’m here to find someone for hookup. I’m not interested in something serious. I would love to hear your adventurous story.',
                                  style: TextStyle(
                                      color: ColorConstants.secondary,
                                      fontSize: 16,
                                      height: 1.5,
                                      fontWeight: FontWeight.normal)),
                              const SizedBox(
                                height: 32,
                              ),
                              // interests
                              Text('INTERESTS',
                                  style: TextStyle(
                                      color: ColorConstants.secondary,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500)),
                              const SizedBox(
                                height: 8,
                              ),
                              Wrap(
                                spacing: 10,
                                children: [
                                  _chip(
                                      background: ColorConstants.lightOrange,
                                      color: ColorConstants.brightOrange,
                                      title: 'Travel'),
                                  _chip(
                                      background: ColorConstants.lightBlue,
                                      color: ColorConstants.brightBlue,
                                      title: 'Dance'),
                                  _chip(
                                      background: ColorConstants.lightOrange1,
                                      color: ColorConstants.brightOrange1,
                                      title: 'Fitness'),
                                  _chip(
                                      background: ColorConstants.lightPurple,
                                      color: ColorConstants.brightPurple,
                                      title: 'Reading'),
                                  _chip(
                                      background: ColorConstants.lightPurple1,
                                      color: ColorConstants.brightPurple1,
                                      title: 'Photography'),
                                  _chip(
                                      background: ColorConstants.lightGreen,
                                      color: ColorConstants.brightGreen,
                                      title: 'Music'),
                                  _chip(
                                      background: ColorConstants.lightPink,
                                      color: ColorConstants.brightPink,
                                      title: 'Movie'),
                                ],
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              Text('Education and Career',
                                  style: TextStyle(
                                      color: ColorConstants.secondary,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500)),
                              const SizedBox(
                                height: 8,
                              ),
                              Wrap(
                                spacing: 10,
                                children: [
                                  _chip(
                                      background: Colors.grey.shade200,
                                      color: Colors.black,
                                      title: 'Travel'),
                                  _chip(
                                      background: Colors.grey.shade200,
                                      color: Colors.black,
                                      title: 'Dance'),
                                  _chip(
                                      background: Colors.grey.shade200,
                                      color: Colors.black,
                                      title: 'Fitness'),
                                  _chip(
                                      background: Colors.grey.shade200,
                                      color: Colors.black,
                                      title: 'Reading'),
                                  _chip(
                                      background: Colors.grey.shade200,
                                      color: Colors.black,
                                      title: 'Photography'),
                                  _chip(
                                      background: Colors.grey.shade200,
                                      color: Colors.black,
                                      title: 'Music'),
                                  _chip(
                                      background: Colors.grey.shade200,
                                      color: Colors.black,
                                      title: 'Movie'),
                                ],
                              ),
                              const SizedBox(
                                height: 24,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: const [
                                        Icon(
                                          Icons.flag_outlined,
                                          color: Colors.black,
                                          size: 30,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text('Report',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600)),
                                      ],
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          .2,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Alert(
                                              onPressed: () {
                                                context
                                                    .read<BlockedUserProvider>()
                                                    .blockAdd(
                                                        context: context,
                                                        mapData: {
                                                      "blocked_user_id": value
                                                          .randomuser[value
                                                              .currentIndex]
                                                          .id
                                                    });
                                              },
                                              maintext:
                                                  "Blocking ${value.randomuser[value.currentIndex].username}",
                                              text1:
                                                  'Are you sure you want to block ',
                                              textbutton1: 'Yes',
                                              buttoncolor: Colors.red,
                                              textbutton2: "Cancel",
                                              onPressed2: () {
                                                Navigator.pop(context);
                                              },
                                              buttoncolor2: Colors.black,
                                            );
                                          },
                                        );
                                      },
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: const [
                                          Icon(
                                            Icons.block,
                                            color: Colors.black,
                                            size: 30,
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text('Block ',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600)),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          .2,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: const [
                                        Icon(
                                          Icons.share,
                                          color: Colors.black,
                                          size: 30,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text('Share',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600)),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 100,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // slivers: [
                    // SliverToBoxAdapter(
                    //   child:
                    // ),
                    // SliverToBoxAdapter(
                    //   child:
                    // ),
                  ),
                  Positioned(
                      bottom: 60,
                      left: 30,
                      right: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              context.read<RandomUserProvider>().getNextUser();
                            },
                            child: Container(
                              width: 64,
                              height: 64,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 8,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Icon(
                                Icons.close,
                                color: ColorConstants.close,
                                size: 32,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              width: 64,
                              height: 64,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 8,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Icon(
                                Icons.favorite,
                                color: ColorConstants.favorite,
                                size: 32,
                              ),
                            ),
                          ),
                        ],
                      ))
                ],
              )
            : Center(
                child: CircularProgressIndicator(
                    color: ColorConstants.primaryColor),
              );
      }),
    );
  }

  Widget _chip(
      {required Color background,
      required Color color,
      required String title}) {
    return Chip(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      label: Text(title, style: TextStyle(color: color)),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      backgroundColor: background,
    );
  }
}
