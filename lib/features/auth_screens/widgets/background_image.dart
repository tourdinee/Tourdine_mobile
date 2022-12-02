import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

BoxDecoration backgroundDecoration(String image, [bool filter = true]) {
  return BoxDecoration(
    image: DecorationImage(
      colorFilter: filter
          ? const ColorFilter.mode(Color(0xaa000000), BlendMode.darken)
          : null,
      image: AssetImage("$imagesPath/$image"),
      fit: BoxFit.cover,
    ),
  );
}
