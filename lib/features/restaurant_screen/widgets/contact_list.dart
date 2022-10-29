import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/constants.dart';
import '../../../constants/text_style.dart';

class ContactListTile extends StatelessWidget {
  const ContactListTile({
    Key? key,
    required this.title,
    required this.imgPath,
  }) : super(key: key);
  final String title;
  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SvgPicture.asset(
            "$iconsPath/$imgPath",
            width: 12,
            height: 12,
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: smallTextStyle.copyWith(
                color: (title.contains("@") && title.contains(".com"))
                    ? Colors.red
                    : Colors.black),
          )
        ],
      ),
    );
  }
}
