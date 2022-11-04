import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/constants.dart';
import '../../../constants/text_style.dart';
import '../../restaurant_screen/widgets/rate_container.dart';

class ReviewTile2 extends StatelessWidget {
  const ReviewTile2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.grey,
      elevation: 4,
      child: ListTile(
        tileColor: Colors.white,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        shape: const OutlineInputBorder(borderSide: BorderSide.none),
        leading: Container(
          width: 45,
          height: 45,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(
                "$imagesPath/chicken_republic.png",
              ),
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Chicken Republic"),
            const SizedBox(height: 4),
            Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.",
                style: GoogleFonts.montserrat(fontSize: 12)),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RateBox(
              style: smallTextStyle.copyWith(color: Colors.black),
            ),
            Text(
              "8:30 am",
              style: smallTextStyle.copyWith(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
