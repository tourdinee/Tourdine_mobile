import 'package:flutter/material.dart';
import 'package:tourdine/constants/text_style.dart';

class RestaurantCategoriesContainer extends StatelessWidget {
  const RestaurantCategoriesContainer({
    Key? key,
    required this.categories,
  }) : super(key: key);
  final String categories;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1),
      margin: const EdgeInsets.only(left: 6),
      color: Colors.white,
      child: Text(
        categories,
        style: smallestTextStyle,
      ),
    );
  }
}
