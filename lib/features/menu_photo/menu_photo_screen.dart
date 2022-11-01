import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tourdine/constants/constants.dart';
import 'package:tourdine/constants/text_style.dart';
import 'package:tourdine/features/auth_screens/logic/logic.dart';

import 'view_photo/view_photo.dart';

class MenuPhotoScreen extends StatelessWidget {
  const MenuPhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(18.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(
              "$iconsPath/back.svg",
            ),
          ),
        ),
        title: Text(
          "Menu & Photos",
          style: titleTextStyle,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                GridView.builder(
                  itemCount: 6,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 1.18,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => navigateTo(
                          const ViewPhotoScreen(photo: "photo_2.png"),
                          context,
                          true),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: const DecorationImage(
                            image: AssetImage(
                              "$imagesPath/photo_2.png",
                            ),
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Container(
                  width: 380,
                  height: 253,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: const DecorationImage(
                      image: AssetImage(
                        "$imagesPath/photo_3.png",
                      ),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
