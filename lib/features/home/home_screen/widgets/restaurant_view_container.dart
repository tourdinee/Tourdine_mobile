import 'package:flutter/material.dart';
import 'package:tourdine/features/auth_screens/logic/logic.dart';
import 'package:tourdine/features/restaurant_screen/restuarant_screen.dart';

import '../../../../constants/text_style.dart';
import 'components.dart';

class RestaurantsViewContainer extends StatelessWidget {
  const RestaurantsViewContainer({
    Key? key,
    required this.name,
    required this.address,
    required this.categories,
    required this.images,
    required this.isOpen,
  }) : super(key: key);
  final String name;
  final String address;
  final String categories;
  final String images;
  final bool isOpen;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => navigateTo(const RestaurantScreen(), context, true),
      child: SizedBox(
        height: 259,
        width: 380,
        child: Container(
          margin: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: AssetImage(images),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: const Color(0xffeeeeee),
                      ),
                      child: Text(isOpen ? "OPEN" : "CLOSE",
                          style: const TextStyle(
                              color: Colors.green, fontSize: 12)),
                    ),
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: const Color(0xffeeeeee),
                      ),
                      child:
                          const Text("⭐ 4.5", style: TextStyle(fontSize: 12)),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          name,
                          style: textStyle1,
                        ),
                        RestaurantCategoriesContainer(categories: categories)
                      ],
                    ),
                    Text(
                      address,
                      style: smallTextStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}