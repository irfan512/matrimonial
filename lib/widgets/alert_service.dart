import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Alert extends StatefulWidget {
  String? maintext;
  String? text1;
  String? textbutton1;
  String? textbutton2;

  Color? buttoncolor;
  Color? buttoncolor2;
 final VoidCallback? onPressed;
 final VoidCallback? onPressed2;

  Alert(
      {super.key,
      this.buttoncolor,
      this.buttoncolor2,
      this.maintext,
      this.onPressed,
      this.textbutton2,
      this.onPressed2,
      this.text1,
      this.textbutton1});

  @override
  State<Alert> createState() => _AlertState();
}

class _AlertState extends State<Alert> {
  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(widget.maintext!),
      content: Text(widget.text1!),
      actions: [
        CupertinoDialogAction(
            isDefaultAction: true,
            isDestructiveAction: true,
            onPressed: widget.onPressed,
            child: Text(
              widget.textbutton1!,
              style: TextStyle(color: widget.buttoncolor!),
            ),
            
            ),
        CupertinoDialogAction(
          onPressed: widget.onPressed2,
          child: Text(
            widget.textbutton2!,
            style: TextStyle(color: widget.buttoncolor2!),
          ),
        ),
      ],
    );
  }
}
