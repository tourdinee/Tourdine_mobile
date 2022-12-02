import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/color.dart';
import '../../../constants/constants.dart';
import '../../../constants/text_style.dart';
import '../../auth_screens/logic/logic.dart';
import '../../auth_screens/login_screen.dart';
import 'language_screen.dart';
import 'password_screen.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios)),
        title: const Text("Settings"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              const SettingSubTitle(text: "Account"),
              SubSetting(
                text: "Change Password",
                callback: () =>
                    navigateTo(const PasswordSCreen(), context, true),
              ),
              SubSetting(
                text: "Change Language",
                callback: () =>
                    navigateTo(const LanguageScreen(), context, true),
              ),
              const SizedBox(height: 16),
              const SettingSubTitle(text: "Others"),
              SubSetting(text: "Privacy", callback: () {}),
              SubSetting(text: "Term and Condition", callback: () {}),
              SubSetting(
                text: "Logout",
                callback: () {
                  bool isLogout = false;
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Material(
                        color: Colors.transparent,
                        child: Center(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.75,
                            height: 140,
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: mainColor)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Are you sure you want to Exit",
                                    style: textStyle1.copyWith(
                                        color: Colors.black87),
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.white,
                                              side:
                                                  BorderSide(color: mainColor)),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            "No",
                                            style: textStyle1.copyWith(
                                                color: const Color(0xff000000)),
                                          )),
                                      const SizedBox(
                                        width: 25,
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: mainColor),
                                        onPressed: () {
                                          isLogout = true;
                                          navigateTo(
                                              const LoginScreen(), context);
                                        },
                                        child: const Text("Yes"),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SubSetting extends StatelessWidget {
  const SubSetting({
    Key? key,
    required this.text,
    required this.callback,
  }) : super(key: key);
  final String text;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            text,
            style: textStyle1.copyWith(fontSize: 14, color: Colors.black87),
          ),
        ),
        IconButton(
          onPressed: callback,
          icon: (text == "Logout")
              ? SvgPicture.asset("$iconsPath/logout.svg")
              : const Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
        )
      ],
    );
  }
}

class SettingSubTitle extends StatelessWidget {
  const SettingSubTitle({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(color: mainColor),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Text(
        text,
        style: textStyle1.copyWith(color: Colors.black87),
      ),
    );
  }
}
