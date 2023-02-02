import 'package:flutter/material.dart';
import 'package:tourdine/constants/color.dart';
import 'package:tourdine/models/restaurant.dart';

import '../../../../constants/constants.dart';
import '../../../../constants/text_style.dart';
import '../../../auth_screens/logic/navigate_to.dart';
import '../../../restaurant_screen/restuarant_screen.dart';

class TrendingScrollLayout extends StatelessWidget {
  const TrendingScrollLayout({
    Key? key,
    required this.restaurantList,
  }) : super(key: key);
  final List<Restaurant> restaurantList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 335,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            constraints:
                const BoxConstraints(maxHeight: 185, maxWidth: double.infinity),
            child: ScrollContainerWidget(
              restaurants: restaurantList,
            ),
          ),
        ],
      ),
    );
  }
}

class ScrollContainerWidget extends StatefulWidget {
  const ScrollContainerWidget({super.key, required this.restaurants});
  final List<Restaurant> restaurants;

  @override
  State<ScrollContainerWidget> createState() => _ScrollContainerWidgetState();
}

class _ScrollContainerWidgetState extends State<ScrollContainerWidget> {
  late PageController _pageController;
  int _currentPage = 2;

  @override
  void initState() {
    super.initState();
    _pageController =
        PageController(initialPage: _currentPage, viewportFraction: 0.7);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.restaurants.length,
            itemBuilder: (context, index) {
              final restaurant = widget.restaurants[index];
              return GestureDetector(
                onTap: () {
                  navigateTo(
                      RestaurantScreen(
                        restaurant: restaurant,
                      ),
                      context,
                      true,
                      true);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  width: 200,
                  height: 175,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      colorFilter:
                          ColorFilter.mode(Color(0xaa000000), BlendMode.color),
                      image: AssetImage("$imagesPath/restaurant_img_1.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "⭐ 4.5",
                          style: smallTextStyle,
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
                            Text(
                              restaurant.name,
                              style: textStyle1,
                            ),
                            Text(
                              restaurant.address,
                              style: smallTextStyle,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 200,
          child: Row(
            children: [
              ...List.generate(
                widget.restaurants.length,
                (index) {
                  return Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: (index == _currentPage)
                            ? mainColor
                            : mainColor.withAlpha(120),
                        borderRadius: BorderRadius.circular(.5),
                      ),
                      height: 3,
                    ),
                  );
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
