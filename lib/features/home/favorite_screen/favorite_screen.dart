import 'package:flutter/material.dart';
import 'package:tourdine/constants/constants.dart';
import 'package:tourdine/features/home/home_screen/widgets/widgets.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({
    super.key,
  });

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
                  itemCount: 6,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return const RestaurantsViewContainer(
                      name: "name",
                      address: "address",
                      categories: "categories",
                      images: "$imagesPath/photo_1.png",
                      isOpen: true,
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
