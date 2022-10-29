import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../constants/text_style.dart';
import 'rate_container.dart';

class ReviewTile extends StatelessWidget {
  const ReviewTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      shape: const OutlineInputBorder(borderSide: BorderSide.none),
      leading: Container(
        width: 45,
        height: 45,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(
              "$imagesPath/profile_pic.png",
            ),
          ),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Tayo"),
          const SizedBox(height: 4),
          Text(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.",
            style: smallestTextStyle.copyWith(
              color: Colors.black38,
            ),
          ),
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
    );
  }
}
