import 'package:flutter/material.dart';
import 'package:tourdine/constants/constants.dart';
import 'package:tourdine/constants/text_style.dart';

class ViewPhotoScreen extends StatelessWidget {
  const ViewPhotoScreen({super.key, required this.photo});
  final String photo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xffffffff),
          ),
        ),
        title: Text(
          "Preview",
          style: titleTextStyle.copyWith(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("$imagesPath/$photo"),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
