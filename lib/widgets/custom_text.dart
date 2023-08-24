import 'package:flutter/material.dart';

Widget customText(String text,
    {double? fontSize,
    FontWeight? fontWeight,
    Color? textColor,
    TextAlign? textAlign}) {
  return Text(
    text,
    style: TextStyle(
        fontSize: fontSize,
        color: textColor ?? Colors.black,
        fontWeight: fontWeight),
    textAlign: textAlign,
  );
}
