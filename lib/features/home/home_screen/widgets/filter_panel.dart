import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tourdine/constants/color.dart';
import 'package:tourdine/constants/constants.dart';

import '../../../../constants/text_style.dart';

class FilterPanel extends StatefulWidget {
  const FilterPanel({super.key});

  @override
  State<FilterPanel> createState() => _FilterPanelState();
}

class _FilterPanelState extends State<FilterPanel> {
  int selectedIndex = 0;
  RangeValues initialRage = const RangeValues(0, 100);
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
              boxShadow: const [
                BoxShadow(
                  offset: Offset(.2, .2),
                  blurRadius: 1,
                  blurStyle: BlurStyle.outer,
                )
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Filter",
                      style: textStyle1.copyWith(color: Colors.black),
                    ),
                    SvgPicture.asset(
                      "$iconsPath/cancel.svg",
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              const FilterProperty(title: "Categories"),
              const FilterCategoriesContainer(),
              const SizedBox(height: 10),
              const FilterProperty(title: "Distances"),
              RangeSlider(
                values: initialRage,
                onChanged: (value) {
                  setState(() {
                    initialRage = value;
                  });
                },
                max: 100,
                min: 0,
                activeColor: mainColor,
              ),
              const FilterProperty(title: "Ratings"),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      color: mainColor.withAlpha(30),
                      borderRadius: BorderRadius.circular(3)),
                  padding: const EdgeInsets.all(4),
                  child: const Text("⭐⭐⭐⭐⭐"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FilterProperty extends StatelessWidget {
  const FilterProperty({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Text(
        title,
        style: smallTextStyle.copyWith(
          color: Colors.black87,
          fontSize: 13,
        ),
      ),
    );
  }
}

class FilterCategoriesContainer extends StatelessWidget {
  const FilterCategoriesContainer({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          FilterCategories(text: "Fine Dinning"),
          FilterCategories(text: "Budget Friendly"),
          FilterCategories(text: "Fast Food"),
        ],
      ),
    );
  }
}

class FilterCategories extends StatelessWidget {
  const FilterCategories({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
      decoration: BoxDecoration(
          border: Border.all(color: mainColor),
          borderRadius: BorderRadius.circular(4)),
      child: Text(
        text,
        style: smallTextStyle.copyWith(color: Colors.black87),
      ),
    );
  }
}
