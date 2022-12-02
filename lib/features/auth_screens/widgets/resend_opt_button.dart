import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/text_style.dart';
import '../../../helpers/loading/loading_screen.dart';
import 'opt_sent.dart';

class ResendOtpButton extends StatelessWidget {
  const ResendOtpButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () async {
          LoadingScreen().show(context: context, text: "");
          await Future.delayed(
              const Duration(seconds: 2), () => LoadingScreen().hide());
          showCupertinoModalPopup(
              context: context,
              builder: (BuildContext context) {
                return const OtpSent();
              });
          await Future.delayed(
            const Duration(milliseconds: 500),
          );
          Navigator.pop(context);
        },
        child: Text(
          "Resend OTP",
          style: textStyle2red.copyWith(shadows: [
            const Shadow(color: Colors.white, offset: Offset(0, -5))
          ]),
        ));
  }
}
