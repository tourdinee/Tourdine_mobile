import 'dart:io';

import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    Key? key,
    required this.picture,
    required this.setProfilePic,
  }) : super(key: key);

  final String picture;
  final VoidCallback setProfilePic;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: const Color(0x44ffffff),
          backgroundImage: FileImage(
            (picture.isNotEmpty) ? File(picture) : File(""),
          ),
          child: (picture.isNotEmpty)
              ? null
              : const Icon(
                  Icons.person_outline,
                  size: 75,
                  color: Color(0xffffffff),
                ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: GestureDetector(
            onTap: setProfilePic,
            child: const CircleAvatar(
              radius: 16,
              backgroundColor: Color(0x55ff0000),
              child: Icon(Icons.arrow_upward),
            ),
          ),
        )
      ],
    );
  }
}
