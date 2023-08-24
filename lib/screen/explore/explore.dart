
import 'package:flutter/material.dart';
import 'package:us_muslim_match/screen/explore/proposal_requested.dart';
import 'package:us_muslim_match/screen/explore/proposal_sent.dart';

import '../../config/colors.dart';
import 'block_users.dart';
import 'favourite.dart';

class Explore extends StatefulWidget {
  const Explore({super.key});

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: ColorConstants.primaryColor,
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: ColorConstants.primaryColor,
            tabs: const [
              Tab(
                text: "Sent Proposal",
              ),
              Tab(
                text: "Proposal Requested",
              ),
              Tab(
                text: "Favourite",
              ),
              Tab(
                text: "Blocked",
              ),
            ],
          ),
          title: Text(
            'Explore',
            style: TextStyle(
              color: ColorConstants.primaryColor,
            ),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: TabBarView(
          children: [ProposalSent(), ProposalRequest(), Favourite(), Blocked()],
        ),
      ),
    );
  }
}
