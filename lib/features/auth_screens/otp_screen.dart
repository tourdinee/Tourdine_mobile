import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourdine/constants/constants.dart';
import 'package:tourdine/constants/text_style.dart';
import 'package:tourdine/features/auth_screens/widgets/account_verified.dart';

import '../../helpers/loading/loading_screen.dart';
import 'widgets/widget.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
          colorFilter: ColorFilter.mode(Color(0x87000000), BlendMode.darken),
          image: AssetImage("$imagesPath/otpBackgroundImg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 40),
        child: Center(
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Confirmation ",
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w700,
                      fontSize: 32,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "An OTP code has been sent to your mail. Input the code to verify your account. ",
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.18),
                      hintText: "OTP",
                      hintStyle: GoogleFonts.montserrat(color: Colors.white),
                      prefixIcon: const Icon(
                        Icons.key,
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    maxLines: 1,
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                    onPressed: () async {
                      LoadingScreen().show(context: context, text: "");
                      await Future.delayed(const Duration(seconds: 2),
                          () => LoadingScreen().hide());
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
                    )),
                GestureDetector(
                  onTap: () async {
                    LoadingScreen().show(context: context, text: "");
                    await Future.delayed(const Duration(seconds: 2),
                        () => LoadingScreen().hide());
                    showCupertinoModalPopup(
                        context: context,
                        builder: (BuildContext context) {
                          return const AccountVerified();
                        });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(237, 28, 36, 0.45),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            "Submit",
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: Colors.white),
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
      ),
    ));
  }
}
