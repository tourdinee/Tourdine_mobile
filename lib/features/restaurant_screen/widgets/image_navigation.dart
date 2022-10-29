import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/constants.dart';

class RestaurantScreenImageNavigation extends StatelessWidget {
  const RestaurantScreenImageNavigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: Container(
        alignment: Alignment.topCenter,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("$imagesPath/farm_city.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  "$iconsPath/back.svg",
                  color: Colors.white,
                ),
              ),
              const Expanded(child: SizedBox()),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.share_outlined,
                    color: Colors.white,
                  )),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.star_outline,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
