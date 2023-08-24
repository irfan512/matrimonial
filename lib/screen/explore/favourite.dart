import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:us_muslim_match/provider/favourites_provider.dart';

import '../../config/colors.dart';
import '../../provider/blocked_provider.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<FavouriteUserProvider>(builder: (context, value, child) {
      return ListView.builder(
          itemCount: value.favUsers.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.all(12.0),
                child: value.check == true
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 60,
                                      decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.black,
                                          image: DecorationImage(
                                              image: NetworkImage(
                                            // blockeduser[index]
                                            //     .avatar
                                            //     .toString()
                                            "",
                                          ))),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "",
                                          // blockeduser[index]
                                          //     .username
                                          //     .toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),

//                                             blockeduser[index].verified=="1"
// ?verified():SizedBox()
                                      ],
                                    ),
                                  ],
                                ),
                                Container(
                                  width: 90,
                                  height: 30,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          primary: ColorConstants.brightGreen),
                                      onPressed: () {
                                        showDialog<bool>(
                                          barrierDismissible: false,
                                          context: context,
                                          builder: (context) {
                                            return CupertinoAlertDialog(
                                              title: const Text(
                                                  'Are you sure you want to unblock this user?'),
                                              actions: [
                                                CupertinoDialogAction(
                                                  isDefaultAction: true,
                                                  isDestructiveAction: true,
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text(
                                                    'Yes',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                ),
                                                // const SizedBox(
                                                //   width: 10,
                                                // ),
                                                CupertinoDialogAction(
                                                  isDestructiveAction: true,
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text(
                                                    'No',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      child: Text(
                                        "Unblock",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: ColorConstants.brightGreen,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("People you add favourite will appear here"),
                        ],
                      ));
          });
    }));
  }
}


//  Center(
//         child: Text("People you add favourite will appear here"),
//       ),