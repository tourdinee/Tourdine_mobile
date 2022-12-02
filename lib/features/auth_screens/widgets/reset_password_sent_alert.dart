import 'package:flutter/material.dart';

import '../../../constants/color.dart';
import '../../../constants/constants.dart';
import '../../../constants/text_style.dart';
import '../logic/logic.dart';
import '../login_screen.dart';

class ResetPasswordSentAlert extends StatelessWidget {
  const ResetPasswordSentAlert({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

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
              const SizedBox(height: 20),
              Text(
                "A Password Reset has been sent\nto your email\n${controller.text}",
                textAlign: TextAlign.center,
                style: textStyle2,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () =>
                    navigateTo(const LoginScreen(), context, false),
                style: ElevatedButton.styleFrom(
                  backgroundColor: mainColor,
                ),
                child: const Text("Next"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
