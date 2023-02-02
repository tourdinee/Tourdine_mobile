import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/restaurant.dart';
import '../home/home_screen/provider/provider.dart';
import '../home/home_screen/widgets/widgets.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({
    super.key,
    required this.title,
    required this.restaurantList,
  });

  final String title;
  final List<Restaurant> restaurantList;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Restaurant> restaurants = widget.restaurantList;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                child: Column(
                  children: [
                    SearchBar(
                      showShadow: true,
                      controller: controller,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Consumer(
                        builder: (context, ref, child) {
                          String text = ref.watch(myProvider) as String;
                          bool isFilter = ref.watch(isFilterProvider) as bool;
                          if (text.isNotEmpty && isFilter == false) {
                            return const SearchPanel();
                          } else if (isFilter) {
                            return const FilterPanel();
                          } else {
                            return const SizedBox();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: restaurants.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return RestaurantsViewContainer(
                      restaurant: restaurants[index],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
