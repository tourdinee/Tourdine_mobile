import 'package:flutter/material.dart';
import 'package:tourdine/features/auth_screens/logic/logic.dart';
import 'package:tourdine/features/home/home_screen/widgets/widgets.dart';
import 'package:tourdine/features/trending_screen/trending_screen.dart';

import '../../../../constants/constants.dart';
import '../../../../constants/text_style.dart';

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
                  const CategoriesScreen(
                    title: "Fining Dinning",
                    child: RestaurantsViewContainer(
                      name: "Slow Lagos",
                      address: "2 Musa Yar’Adua Street V.I Lagos",
                      categories: "Fine Dining",
                      images: "$imagesPath/slow_lagos.png",
                      isOpen: true,
                    ),
                  ),
                  context,
                  true),
            ),
            CategoryContainer(
              text: "Budget Friendly",
              image: "budget_friendly.png",
              callback: () => navigateTo(
                  const CategoriesScreen(
                    title: "Budget Friendly",
                    child: RestaurantsViewContainer(
                      name: "Farm City",
                      address:
                          "15 Admiralty Way Lekki Phase 1, Lagos/36 Ogudu Road, Ojota, Lagos.",
                      categories: "Budget Friendly",
                      images: "$imagesPath/farm_city.png",
                      isOpen: true,
                    ),
                  ),
                  context,
                  true),
            ),
            CategoryContainer(
              text: "Fast Food",
              image: "fast_food.png",
              callback: () => navigateTo(
                  const CategoriesScreen(
                    title: "Fast Food",
                    child: RestaurantsViewContainer(
                      name: "Chicken Republic",
                      address:
                          "Lekki / Gbagada / Ajah / Ikorodu / Alimosho / Ojudu Berger ",
                      categories: "Fast food",
                      images: "$imagesPath/chicken_republic.png",
                      isOpen: true,
                    ),
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
