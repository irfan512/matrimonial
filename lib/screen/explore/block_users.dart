import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:us_muslim_match/provider/blocked_provider.dart';

import '../../config/colors.dart';

class Blocked extends StatefulWidget {
  const Blocked({super.key});

  @override
  State<Blocked> createState() => _BlockedState();
}

class _BlockedState extends State<Blocked> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<BlockedUserProvider>().blockUsers(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<BlockedUserProvider>(builder: (context, value, child) {
      if (value.check == true) {
        if (value.blockedUserlist.isNotEmpty) {
          return ListView.builder(
              shrinkWrap: true,
              itemCount: value.blockedUserlist.length,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
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
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                          value
                                              .blockedUserlist[index].profilePic
                                              .toString(),
                                        ))),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        value.blockedUserlist[index].username
                                            .toString(),
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
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
                                                  context
                                                      .read<
                                                          BlockedUserProvider>()
                                                      .blockRemove(
                                                          context: context,
                                                          index: index,
                                                          mapData: {
                                                        "blocked_user_id": value
                                                            .blockedUserlist[
                                                                index]
                                                            .id,
                                                      });
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
                    ));
              });
        } else {
          return const Center(
            child: Text("People you block will appear here"),
          );
        }
      } else {
        return Center(
            child: CircularProgressIndicator(
          color: ColorConstants.primaryColor,
        ));
      }
    }));
  }
}
