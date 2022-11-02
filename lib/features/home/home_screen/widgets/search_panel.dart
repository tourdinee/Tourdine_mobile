import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants/constants.dart';
import '../../../../constants/text_style.dart';

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
