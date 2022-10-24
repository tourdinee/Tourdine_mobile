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
          backgroundImage:
              (picture.isNotEmpty) ? FileImage(File(picture)) : null,
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
            child: CircleAvatar(
              radius: 14,
              backgroundColor: const Color(0x55ff0000),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.arrow_upward,
                    size: 16,
                  ),
                  Container(
                    width: 10,
                    height: 1,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 2)
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
