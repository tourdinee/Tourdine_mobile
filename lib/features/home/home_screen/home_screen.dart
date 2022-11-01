import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tourdine/constants/constants.dart';
import 'package:tourdine/constants/text_style.dart';

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
                if (controller.text.isNotEmpty) const SearchPanel(),
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

class SearchPanel extends StatefulWidget {
  const SearchPanel({super.key});

  @override
  State<SearchPanel> createState() => _SearchPanelState();
}

class _SearchPanelState extends State<SearchPanel> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 90,
      right: 20,
      left: 20,
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 40,
        height: 200,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          constraints: BoxConstraints(
            maxHeight: 200,
            maxWidth: MediaQuery.of(context).size.width - 40,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListView.builder(
            itemCount: dummyString.length + 1,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Suggestions",
                        style: smallTextStyle.copyWith(
                            fontSize: 14, color: Colors.black87),
                      ),
                      SvgPicture.asset(
                        "$iconsPath/cancel.svg",
                        width: 20,
                      )
                    ],
                  ),
                );
              }
              return GestureDetector(
                onTap: () {
                  selectedIndex = index;
                  setState(() {});
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  decoration: BoxDecoration(
                    color: (index == selectedIndex)
                        ? const Color.fromARGB(255, 235, 171, 171)
                        : Colors.white,
                  ),
                  child: Text(
                    dummyString[index - 1],
                    style: smallTextStyle.copyWith(
                      fontSize: 14,
                      color: (index == selectedIndex)
                          ? Colors.black87
                          : Colors.black38,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

List<String> dummyString = ["Farm City", "Fish Farm", "Ofada boy", "KFC"];
