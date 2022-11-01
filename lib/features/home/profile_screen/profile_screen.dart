import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tourdine/constants/constants.dart';
import 'package:tourdine/constants/text_style.dart';
import 'package:tourdine/features/auth_screens/logic/logic.dart';
import 'package:tourdine/features/restaurant_screen/widgets/review_tile.dart';

import 'setting_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String picture = "";

  bool isEditProfile = false;

  void setProfilePicture() async {
    final res = await pickImage();
    print("picture: $res");
    if (res.isNotEmpty) {
      picture = res;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Profile",
          style: titleTextStyle,
        ),
        actions: [
          IconButton(
            onPressed: () => navigateTo(const SettingScreen(), context, true),
            icon: SvgPicture.asset("$iconsPath/setting.svg"),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
              width: double.infinity,
            ),
            Stack(
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
                          color: Color(0xff000000),
                        ),
                ),
                if (isEditProfile)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: GestureDetector(
                      onTap: setProfilePicture,
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
            ),
            const SizedBox(height: 16),
            !isEditProfile
                ? SizedBox(
                    child: Column(
                      children: [
                        Text(
                          "John Adeniyi",
                          style: textStyle1.copyWith(color: Colors.black),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          "johnadeniyi@gail.com",
                          style: textStyle1.copyWith(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffff0000)),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Material(
                                  color: Colors.transparent,
                                  child: Center(
                                    child: SizedBox(
                                      width: 120,
                                      height: 160,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(color: Colors.red),
                                          color: Colors.white,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            TextButton(
                                              onPressed: () {
                                                setState(() {
                                                  isEditProfile =
                                                      !isEditProfile;
                                                });
                                                Navigator.pop(context);
                                              },
                                              child: const Text("Edit"),
                                            ),
                                            TextButton(
                                              onPressed: () {},
                                              child: const Text("Delete"),
                                            ),
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              child: const Text("Cancel"),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: const Text("Edit Profile"),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(thickness: 2),
                      ],
                    ),
                  )
                : SizedBox(
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 35.0),
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10.0),
                              hintText: "Name",
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xffff0000),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 35.0),
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10.0),
                              hintText: "Email",
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xffff0000),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffff0000)),
                          onPressed: () {
                            setState(() {
                              isEditProfile = !isEditProfile;
                            });
                          },
                          child: const Text("Update"),
                        ),
                      ],
                    ),
                  ),
            if (!isEditProfile)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "My Reviews",
                        style: textStyle2.copyWith(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        child: ListView.separated(
                          itemCount: 7,
                          itemBuilder: (context, index) {
                            return const ReviewTile();
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 8),
                        ),
                      ),
                    ],
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
