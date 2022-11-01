import 'package:flutter/material.dart';
import 'package:tourdine/constants/constants.dart';
import 'package:tourdine/features/auth_screens/logic/logic.dart';
import 'package:tourdine/features/welcome_screen/welcome_screen.dart';

import '../../../constants/text_style.dart';

class AccountVerified extends StatelessWidget {
  const AccountVerified({
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
                "Your Account has been verified",
                style: textStyle2,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => navigateTo(
                  const WelcomeScreen(),
                  context,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffff0000),
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
