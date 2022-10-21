import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourdine/constants/text_style.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/otpBackgroundImg.png"),
                  fit: BoxFit.fill),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.45),
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 40),
              child: Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.9,
                  width: 400,
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
                            hintStyle:
                                GoogleFonts.montserrat(color: Colors.white),
                            prefixIcon: const Icon(
                              Icons.key,
                              color: Colors.white,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide.none),
                          ),
                          maxLines: 1,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextButton(
                          onPressed: () async {
                            showCupertinoModalPopup(
                              context: context,
                              builder: ((context) {
                                return const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.red,
                                    strokeWidth: 5,
                                  ),
                                );
                              }),
                            );
                            await Future.delayed(
                                const Duration(milliseconds: 2000));
                            Navigator.pop(context);
                            showCupertinoModalPopup(
                                context: context,
                                builder: (BuildContext context) {
                                  return Material(
                                    color: Colors.transparent,
                                    child: Container(
                                      color: Colors.black.withOpacity(0.45),
                                      child: Center(
                                          child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          const Image(
                                            image: AssetImage(
                                                "assets/images/successlogo.png"),
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
                                });
                            await Future.delayed(
                                const Duration(milliseconds: 2000));
                            Navigator.pop(context);

                            print("closed");
                          },
                          // () async {
                          //   showCupertinoModalPopup(
                          //     context: context,
                          //     builder: ((context) {
                          //       return const Center(
                          //         child: CircularProgressIndicator(
                          //           color: Colors.red,
                          //           strokeWidth: 5,
                          //         ),
                          //       );
                          //     }),
                          //   );
                          //   await Future.delayed(
                          //       const Duration(milliseconds: 2000));
                          //   Navigator.pop(context);
                          //   print("closed");
                          // },
                          child: Text(
                            "Resend OTP",
                            style: GoogleFonts.montserrat(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          )),
                      GestureDetector(
                        onTap: () async {
                          showCupertinoModalPopup(
                            context: context,
                            builder: ((context) {
                              return const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.red,
                                  strokeWidth: 5,
                                ),
                              );
                            }),
                          );
                          await Future.delayed(
                              const Duration(milliseconds: 2000));
                          Navigator.pop(context);
                          print("closed");
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
          ),
        ],
      ),
    );
  }
}
