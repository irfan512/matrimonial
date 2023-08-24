import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:us_muslim_match/widgets/custom_text.dart';
import '../config/theme.dart';

class Utils {
  static Widget backButton(void Function()? ontab) {
    return IconButton(
        onPressed: ontab,
        icon: const Icon(
          Icons.arrow_back_ios_new_outlined,
          // color: Colors.black,
        ));
  }

  static Widget customRadioTile(
      {required String title,
      required value,
      required groupValue,
      required void Function(String?) funtion}) {
    return RadioListTile<String>(
      activeColor: themeColor,
      contentPadding: EdgeInsets.zero,
      title: customText(title,
          fontSize: 17,
          fontWeight: FontWeight.w500,
          textColor: Colors.grey.shade700),
      value: value,
      groupValue: groupValue,
      onChanged: funtion,
    );
  }

  static Widget heading(text) {
    return customText(text, fontSize: 17.sp, fontWeight: FontWeight.w600);
  }
}
