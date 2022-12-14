import 'package:flutter/material.dart';

import '../../../constants/color.dart';
import '../../../constants/constants.dart';
import '../../../constants/text_style.dart';
import '../../welcome_screen/welcome_screen.dart';
import '../logic/logic.dart';

class AccountVerified extends StatelessWidget {
  const AccountVerified({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

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
                onPressed: () =>
                    navigateTo(WelcomeScreen(name: name), context, false, true),
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
