import 'package:flutter/material.dart';
import 'package:tourdine/constants/constants.dart';
import 'package:tourdine/constants/text_style.dart';
import 'package:tourdine/models/restaurant.dart';

import '../auth_screens/logic/navigate_to.dart';
import '../menu_photo/menu_photo_screen.dart';
import 'widgets/widgets.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({super.key, required this.restaurant});
  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const RestaurantScreenImageNavigation(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            restaurant.name,
                            style: textStyle2.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          const RateBox(
                            style: null,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      ContactListTile(
                        imgPath: "globe.svg",
                        title: restaurant.website,
                      ),
                      ContactListTile(
                        imgPath: "location.svg",
                        title: restaurant.address,
                      ),
                      const ContactListTile(
                        imgPath: "clock.svg",
                        title: "Opening Hours: Monday - Sunday (12am-11pm)",
                      ),
                      ContactListTile(
                        imgPath: "call-red.svg",
                        title: restaurant.contact.toString(),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Menu & Photos",
                            style: textStyle2.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            onPressed: () => navigateTo(
                              const MenuPhotoScreen(),
                              context,
                              true,
                            ),
                            child: Text(
                              "See all (8)",
                              style: textStyle1.copyWith(
                                  color: Colors.grey, fontSize: 14),
                            ),
                          )
                        ],
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ...List.generate(
                              5,
                              (index) {
                                return Container(
                                  width: 150,
                                  height: 170,
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image:
                                          AssetImage("$imagesPath/photo_1.png"),
                                    ),
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Reviews & Ratings",
                            style: textStyle2.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "See all (8)",
                              style: textStyle1.copyWith(
                                  color: Colors.grey, fontSize: 14),
                            ),
                          )
                        ],
                      ),
                      ...List.generate(
                        7,
                        (index) => Column(
                          children: const [
                            ReviewTile(),
                            SizedBox(
                              height: 14,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
