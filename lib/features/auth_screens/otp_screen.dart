import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../helpers/loading/loading_screen.dart';
import 'widgets/account_verified.dart';
import 'widgets/widget.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, required this.name});

  final String name;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DecoratedBox(
      decoration: backgroundDecoration("otpBackgroundImg.png"),
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
                const SizedBox(height: 40),
                SizedBox(
                  height: 50,
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    style: GoogleFonts.montserrat(color: Colors.white),
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
                const ResendOtpButton(),
                const SizedBox(height: 30),
                AuthButton(
                  callback: () async {
                    LoadingScreen().show(context: context, text: "");
                    await Future.delayed(const Duration(seconds: 2),
                        () => LoadingScreen().hide());
                    showCupertinoModalPopup(
                        context: context,
                        builder: (BuildContext context) {
                          return AccountVerified(name: widget.name);
                        });
                  },
                  text: "Submit",
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
