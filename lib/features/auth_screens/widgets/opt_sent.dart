import 'package:flutter/material.dart';
import 'package:tourdine/constants/constants.dart';

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
              image: AssetImage("$imagesPath/successlogo.png"),
            ),
            const SizedBox(height: 16),
            Text(
              "OTP sent",
              style: textStyle2,
            )
          ],
        )),
      ),
    );
  }
}
