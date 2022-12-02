import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/text_style.dart';
import '../../helpers/loading/loading_screen.dart';
import 'logic/navigate_to.dart';
import 'signup_screen.dart';
import 'widgets/widget.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      backgroundColor: const Color(0xff333333),
      body: DecoratedBox(
        decoration: backgroundDecoration("forget_password_bg.png", false),
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(flex: 5, child: SizedBox()),
              Text(
                "Forget Password",
                style: headTextStyle,
              ),
              const Expanded(flex: 1, child: SizedBox(height: 40)),
              CustomTextField(
                  controller: controller, hintText: "Email Address"),
              const Expanded(flex: 2, child: SizedBox(height: 60)),
              AuthButton(
                  callback: () async {
                    LoadingScreen().show(context: context, text: "");
                    await Future.delayed(
                      const Duration(milliseconds: 300),
                      () => LoadingScreen().hide(),
                    );
                    showCupertinoModalPopup(
                        context: context,
                        builder: (BuildContext context) {
                          return ResetPasswordSentAlert(controller: controller);
                        });
                  },
                  text: "Reset Password"),
              const Expanded(flex: 2, child: SizedBox(height: 80)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => navigateTo(const SignUpScreen(), context),
                    child: Text(
                      "Create New Account",
                      style: textStyle2style,
                    ),
                  ),
                ],
              ),
              const Expanded(flex: 3, child: SizedBox()),
            ],
          ),
        )),
      ),
    );
  }
}
