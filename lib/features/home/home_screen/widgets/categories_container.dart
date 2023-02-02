import 'package:flutter/material.dart';

import '../../../../constants/constants.dart';
import '../../../../constants/dummy_data.dart';
import '../../../../constants/text_style.dart';
import '../../../../models/restaurant_category.dart';
import '../../../auth_screens/logic/navigate_to.dart';
import '../../../trending_screen/trending_screen.dart';

class CategoriesContainers extends StatelessWidget {
  const CategoriesContainers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: RestaurantCategory.values
              .map(
                (category) => CategoryContainer(
                  text: category.title,
                  image: category.photo,
                  callback: () {
                    navigateTo(
                        CategoriesScreen(
                          title: category.title,
                          restaurantList: restaurantList,
                        ),
                        context,
                        true,
                        false);
                  },
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({
    Key? key,
    required this.text,
    required this.image,
    required this.callback,
  }) : super(key: key);

  final String text;
  final String image;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: SizedBox(
        width: 250,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          alignment: Alignment.center,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            image: DecorationImage(
              colorFilter:
                  const ColorFilter.mode(Color(0x55000000), BlendMode.darken),
              image: AssetImage("$imagesPath/$image"),
              fit: BoxFit.cover,
            ),
          ),
          child: Text(
            text,
            style: textStyle1.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
