import 'package:flutter/material.dart';
import 'package:tourdine/features/home/notification_screen/review_tile2.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
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
