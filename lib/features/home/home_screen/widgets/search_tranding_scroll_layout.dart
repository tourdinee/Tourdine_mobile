import 'package:flutter/material.dart';
import 'package:tourdine/constants/color.dart';
import 'package:tourdine/constants/constants.dart';

import '../../../../constants/text_style.dart';

class SearchAndTrendingScrollLayout extends StatelessWidget {
  const SearchAndTrendingScrollLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 335,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...List.generate(
                  5,
                  (index) => GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      width: 200,
                      height: 175,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          colorFilter: ColorFilter.mode(
                              Color(0xaa000000), BlendMode.color),
                          image: AssetImage("$imagesPath/restaurant_img_1.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "⭐ 4.5",
                              style: smallTextStyle,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              color: Colors.black38,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Kapadoccia",
                                  style: textStyle1,
                                ),
                                Text(
                                  "16 Idowu Taylor St, Victoria Island 106104,Lagos",
                                  style: smallTextStyle,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: 200,
            child: Row(
              children: [
                ...List.generate(7, (index) {
                  const currentIndex = 2;
                  return Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: (index == currentIndex)
                              ? mainColor
                              : mainColor.withAlpha(120),
                          borderRadius: BorderRadius.circular(.5)),
                      height: 3,
                    ),
                  );
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
