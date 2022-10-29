import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle headTextStyle = GoogleFonts.montserrat(
  color: const Color(0xffffffff),
  fontSize: 24,
  fontWeight: FontWeight.bold,
);

TextStyle textStyle1 = GoogleFonts.montserrat(
  color: const Color(0xffffffff),
  fontSize: 16,
);

TextStyle smallTextStyle = GoogleFonts.montserrat(
  color: const Color(0xffffffff),
  fontSize: 10,
);

TextStyle textStyle2 = GoogleFonts.montserrat(
  color: const Color(0xffffffff),
  fontSize: 18,
);

TextStyle textStyle2style = GoogleFonts.montserrat(
  fontSize: 16,
  color: Colors.transparent,
  shadows: [
    const Shadow(
      color: Colors.white,
      offset: Offset(0, -5),
    )
  ],
  decorationColor: Colors.red,
  decorationStyle: TextDecorationStyle.solid,
  decorationThickness: 3,
  decoration: TextDecoration.underline,
);

TextStyle textStyle2red = GoogleFonts.montserrat(
  fontSize: 16,
  color: Colors.transparent,
  shadows: [
    const Shadow(
      color: Colors.red,
      offset: Offset(0, -5),
    )
  ],
  decorationColor: Colors.red,
  decorationStyle: TextDecorationStyle.solid,
  decorationThickness: 3,
  decoration: TextDecoration.underline,
);

TextStyle titleTextStyle = GoogleFonts.montserrat(
  color: Colors.black,
  fontSize: 18,
  fontWeight: FontWeight.bold,
);

TextStyle smallestTextStyle = GoogleFonts.montserrat(
  fontSize: 8,
  color: Colors.red,
);
