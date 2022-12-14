import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tourdine/constants/constants.dart';
import 'package:tourdine/features/auth_screens/logic/logic.dart';
import 'package:tourdine/features/home/home_bottom_nav_bar.dart';

import '../../constants/color.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key, required this.name});

  final String name;

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("$imagesPath/welcomeBackgroundImg.png"),
                  fit: BoxFit.cover),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.75),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 220, left: 30, right: 30),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: 400,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hello ${widget.name},",
                          style: GoogleFonts.montserrat(
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                              color: Colors.white)),
                      Text("Welcome to",
                          style: GoogleFonts.montserrat(
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                              color: Colors.white)),
                      Text("Tour Dine",
                          style: GoogleFonts.montserrat(
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                              color: mainColor)),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                          "You can now Rate, review and get locations of restaurans near you",
                          style: GoogleFonts.montserrat(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white)),
                      const SizedBox(
                        height: 40,
                      ),
                      GestureDetector(
                        onTap: () =>
                            navigateTo(const HomeBottomNavBar(), context),
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
                                "Lets Get Started",
                                style: GoogleFonts.montserrat(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
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
