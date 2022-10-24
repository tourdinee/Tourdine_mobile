import 'package:flutter/material.dart';

import '../../../constants/text_style.dart';

class OtpSent extends StatelessWidget {
  const OtpSent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        color: Colors.black.withOpacity(0.45),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage("assets/images/successlogo.png"),
              height: 200,
              width: 200,
            ),
            Text(
              "OTP has been sent",
              style: textStyle2,
            )
          ],
        )),
      ),
    );
  }
}
