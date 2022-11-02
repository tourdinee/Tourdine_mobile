import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants/color.dart';
import '../../../../constants/constants.dart';
import '../../../../constants/text_style.dart';
import '../../../auth_screens/logic/logic.dart';
import '../../../trending_screen/trending_screen.dart';
import '../provider/provider.dart';
import 'widgets.dart';

class SearchTendingBottomStaticLayout extends StatelessWidget {
  const SearchTendingBottomStaticLayout({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: mainColor,
        boxShadow: const [
          BoxShadow(color: Colors.grey, offset: Offset(0, 2), blurRadius: 2),
        ],
      ),
      height: 235,
      child: Column(
        children: [
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: SearchBar(
              controller: controller,
            ),
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
                      context,
                      true),
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

class SearchBar extends StatefulWidget {
  const SearchBar({
    Key? key,
    this.showShadow = false,
    required this.controller,
  }) : super(key: key);
  final bool? showShadow;
  final TextEditingController controller;

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color(0xffffffff),
          borderRadius: BorderRadius.circular(12),
          boxShadow: (widget.showShadow == true)
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset("$iconsPath/search.svg"),
          ),
          Expanded(
            child: Consumer(builder: (context, ref, child) {
              return TextField(
                  onChanged: (value) {
                    ref.read(searchBarText.notifier).update((state) => value);
                  },
                  controller: widget.controller,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Find Restaurants",
                  ));
            }),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "$iconsPath/filter-add.svg",
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
