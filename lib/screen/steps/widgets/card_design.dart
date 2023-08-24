import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:us_muslim_match/config/theme.dart';

class CardDesign extends StatelessWidget {
  final Widget? widget;
  const CardDesign({super.key, this.widget});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      elevation: 1,
      // borderRadius: BorderRadius.circular(12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      // color: greyColor,
      child: SizedBox(
        // height: size.height*0.8,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: widget,
        ),
      ),
    );
  }
}
