import 'package:flutter/material.dart';
import 'package:tourdine/constants/text_style.dart';
import 'package:tourdine/features/auth_screens/widgets/widget.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      backgroundColor: const Color(0xff333333),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            CustomTextField(controller: controller, hintText: "enter Email"),
            const SizedBox(height: 16),
            Text(
              "Retrieve Password",
              style: textStyle2,
            ),
          ],
        ),
      )),
    );
  }
}
