import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:us_muslim_match/provider/favourites_provider.dart';
import 'package:us_muslim_match/utils/extensions.dart';

import '../../config/colors.dart';
import '../../provider/blocked_provider.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<FavouriteUserProvider>().makeListEmpty();
    context.read<FavouriteUserProvider>().getFavourite(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<FavouriteUserProvider>(builder: (context, value, child) {
      return Padding(
          padding: const EdgeInsets.all(12.0),
          child: value.favUsers.isNotEmpty && value.check == true
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      Wrap(
                        spacing: MediaQuery.of(context).size.width * .05,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        alignment: WrapAlignment.center,
                        children: [
                          for (int i = 0; i < value.favUsers.length; i++) ...[
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Container(
                                height: 240,
                                width: MediaQuery.of(context).size.width * .43,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      Image.asset(
                                        "assets/images/user1.jpg",
                                        fit: BoxFit.cover,
                                      ),
                                      BackdropFilter(
                                        filter: ImageFilter.blur(
                                            sigmaX: 10, sigmaY: 10),
                                        child: Container(
                                          color: Colors.black.withOpacity(0.3),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                const Text(
                                                  "Mariyum  25",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                10.sh,
                                                const Text(
                                                  "Pakistan",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13),
                                                ),
                                              ],
                                            ),
                                            Icon(
                                              Icons.favorite,
                                              color: Colors.red.shade300,
                                              size: 35,
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ]
                        ],
                      ),
                    ],
                  ),
                )
              : value.favUsers.isEmpty && value.check == true
                  ? const Center(
                      child: Text("People you add favourite will appear here"),
                    )
                  : Center(
                      child: CircularProgressIndicator(
                      color: ColorConstants.primaryColor,
                    )));
    }));
  }
}
