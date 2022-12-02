import 'package:flutter/material.dart';
import 'package:tourdine/features/home/home_screen/widgets/widgets.dart';
import 'package:tourdine/models/restaurant.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({
    super.key,
    required this.restaurantList,
  });
  final List<Restaurant> restaurantList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: restaurantList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return RestaurantsViewContainer(
                      restaurant: restaurantList[index],
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
