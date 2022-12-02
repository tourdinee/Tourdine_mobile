import 'package:flutter/material.dart';
import 'package:tourdine/models/restaurant.dart' show Restaurant;

import '../home/home_screen/widgets/widgets.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({
    super.key,
    required this.title,
    required this.restaurantList,
  });

  final String title;
  final List<Restaurant> restaurantList;

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(title),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SearchBar(
                showShadow: true,
                controller: controller,
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: restaurantList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final Restaurant restaurant = restaurantList[index];
                    return RestaurantsViewContainer(restaurant: restaurant);
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
