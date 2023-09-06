import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:us_muslim_match/utils/extensions.dart';

import '../../../config/colors.dart';
import 'profile_image.dart';

class EmailVerification extends StatefulWidget {
  final String? email;
  const EmailVerification({this.email});

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Verification Code",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: 22),
                    ),
                    15.sh,
                    Text(
                      "Please Enter 6 digit code send to\n ${widget.email}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                    Center(
                      child: PinFieldAutoFill(
                        controller: otpController,
                        codeLength: 6,
                        autoFocus: true,
                        decoration: UnderlineDecoration(
                          lineHeight: 2,
                          lineStrokeCap: StrokeCap.square,
                          bgColorBuilder: PinListenColorBuilder(
                              Colors.green.shade200, Colors.grey.shade300),
                          colorBuilder:
                              const FixedColorBuilder(Colors.transparent),
                        ),
                        onCodeSubmitted: (p0) {
                          print("submitted    $p0");
                        },
                      ),
                    ),
                  ]),
              Center(
                child: InkWell(
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CoverImage()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        border: Border.all(color: ColorConstants.primaryColor)),
                    height: 45,
                    width: 210,
                    child: const Center(
                      child: Text(
                        'Verify',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
