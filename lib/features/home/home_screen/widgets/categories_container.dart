import 'package:flutter/material.dart';
import 'package:tourdine/features/auth_screens/logic/logic.dart';
import 'package:tourdine/features/trending_screen/trending_screen.dart';

import '../../../../constants/constants.dart';
import '../../../../constants/text_style.dart';
import '../../../../models/restaurant.dart';

class CategoriesContainers extends StatelessWidget {
  const CategoriesContainers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            CategoryContainer(
              text: "Fining Dining",
              image: "fine_dinning.png",
              callback: () => navigateTo(
                  CategoriesScreen(
                    title: "Fining Dinning",
                    restaurantList: restaurantList
                        .where((element) => element.category == "fine dining")
                        .toList(),
                  ),
                  context,
                  true),
            ),
            CategoryContainer(
              text: "Budget Friendly",
              image: "budget_friendly.png",
              callback: () => navigateTo(
                  CategoriesScreen(
                    title: "Budget Friendly",
                    restaurantList: restaurantList
                        .where(
                            (element) => element.category == "budget friendly")
                        .toList(),
                  ),
                  context,
                  true),
            ),
            CategoryContainer(
              text: "Fast Food",
              image: "fast_food.png",
              callback: () => navigateTo(
                  CategoriesScreen(
                    title: "Fast Food",
                    restaurantList: restaurantList
                        .where((element) => element.category == "fast food")
                        .toList(),
                  ),
                  context,
                  true,
                  true),
            ),
          ],
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
