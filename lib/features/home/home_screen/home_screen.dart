import 'package:flutter/material.dart';
import 'package:tourdine/constants/text_style.dart';

import 'widgets/widgets.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SearchAndTrendingContainer(),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          child: Text(
            "Categories",
            style: textStyle2.copyWith(
              color: const Color(0xff000000),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 20),
        const CategoriesContainers(),
      ],
    );
  }
}

class SearchAndTrendingContainer extends StatelessWidget {
  const SearchAndTrendingContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        SearchTendingBottomStaticLayout(),
        SearchAndTrendingScrollLayout(),
      ],
    );
  }
}
