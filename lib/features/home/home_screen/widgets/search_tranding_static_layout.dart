import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tourdine/constants/constants.dart';
// import 'package:flutter_svg/flutter_svg.dart';

import 'package:tourdine/features/auth_screens/logic/logic.dart';
import 'package:tourdine/features/trending_screen/trending_screen.dart';

import '../../../../constants/text_style.dart';
import 'widgets.dart';

class SearchTendingBottomStaticLayout extends StatelessWidget {
  const SearchTendingBottomStaticLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.red,
        boxShadow: [
          BoxShadow(color: Colors.grey, offset: Offset(0, 2), blurRadius: 2),
        ],
      ),
      height: 235,
      child: Column(
        children: [
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: SearchBar(),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Trending Restaurants",
                  style: textStyle2,
                ),
                TextButton(
                  onPressed: () => navigateTo(
                      const CategoriesScreen(
                        title: "Trending Restaurants",
                        child: RestaurantsViewContainer(
                          name: "Farm City",
                          address: "36 Ogudu Road, Ojota, Lagos.",
                          images: "$imagesPath/farm_city.png",
                          categories: "budget friendly",
                          isOpen: true,
                        ),
                      ),
                      context),
                  child: Text(
                    "See all (20)",
                    style: textStyle1.copyWith(fontSize: 12),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key, this.showShadow = false}) : super(key: key);
  final bool? showShadow;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xffffffff),
          borderRadius: BorderRadius.circular(12),
          boxShadow: (showShadow == true)
              ? [
                  BoxShadow(
                    color: Colors.red.shade100,
                    blurRadius: 1.5,
                    spreadRadius: 1,
                    offset: const Offset(2, 2),
                  ),
                ]
              : null),
      child: Row(
        children: [
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset("$iconsPath/search.svg")),
          Expanded(
            child: TextField(
                onTap: () {},
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Find Restaurants",
                )),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "$iconsPath/filter_add.svg",
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    List.generate(
      5,
      (index) {
        return const ListTile(title: Text("data"));
      },
    );
    return null;
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return const Icon(Icons.wifi_find);
  }

  @override
  Widget buildResults(BuildContext context) {
    return const ListTile(
      title: Text("search result"),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const ListTile(
      title: Text("search suggestion"),
    );
  }
}
