import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tourdine/constants/text_style.dart';
import 'package:tourdine/features/home/home_screen/provider/provider.dart';

import 'widgets/widgets.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController controller = TextEditingController();

  void callback(val) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                SearchTendingBottomStaticLayout(
                  controller: controller,
                ),
                const SearchAndTrendingScrollLayout(),
                Consumer(
                  builder: (context, ref, child) {
                    if (ref.watch(searchBarText.notifier).state.isNotEmpty) {
                      return const SearchPanel();
                    }
                    return const SizedBox();
                  },
                )
                // if (controller.text.isNotEmpty) const SearchPanel(),
              ],
            ),
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
        ),
      ),
    );
  }
}
