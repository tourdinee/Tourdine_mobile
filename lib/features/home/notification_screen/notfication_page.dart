import 'package:flutter/material.dart';
import 'package:tourdine/features/home/notification_screen/review_tile2.dart';

import '../../restaurant_screen/widgets/review_tile.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 800,
                width: 700,
                child: ListView.separated(
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return const ReviewTile2();
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 8),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
