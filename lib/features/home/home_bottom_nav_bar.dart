import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tourdine/constants/color.dart';
import 'package:tourdine/constants/constants.dart';
import 'package:tourdine/features/home/favorite_screen/favorite_screen.dart';
import 'package:tourdine/features/home/notification_screen/notfication_page.dart';
import 'package:tourdine/features/home/profile_screen/profile_screen.dart';
import 'package:tourdine/features/home/review_screen/review_screen.dart';

import '../../constants/dummy_data.dart';
import 'home_screen/home_screen.dart';

class HomeBottomNavBar extends StatefulWidget {
  const HomeBottomNavBar({super.key});

  @override
  State<HomeBottomNavBar> createState() => _HomeBottomNavBarState();
}

class _HomeBottomNavBarState extends State<HomeBottomNavBar> {
  List<Widget> screen = [
    const Home(),
    FavoriteScreen(
      restaurantList: restaurantList,
    ),
    const ReviewScreen(),
    const Notifications(),
    const ProfileScreen()
  ];
  int currentIndex = 0;
  bool isReviewScreen = false;
  int indexBeforeReview = 0;

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Are you sure?'),
            content: const Text('Do you want to exit an App'),
            actions: <Widget>[
              TextButton(
                onPressed: () =>
                    Navigator.of(context).pop(false), //<-- SEE HERE
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () =>
                    Navigator.of(context).pop(true), // <-- SEE HERE
                child: const Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: screen[currentIndex],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: mainColor,
          onPressed: () {
            if (!isReviewScreen) {
              indexBeforeReview = currentIndex;
              currentIndex = 2;
              isReviewScreen = !isReviewScreen;
            } else {
              currentIndex = indexBeforeReview;
              isReviewScreen = !isReviewScreen;
            }
            setState(() {});
          },
          child:
              isReviewScreen ? const Icon(Icons.close) : const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: mainColor,
          onTap: (value) {
            if (value != 2) {
              isReviewScreen = false;
              currentIndex = value;
              indexBeforeReview = value;
              setState(() {});
            }
          },
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              activeIcon: SvgPicture.asset("$iconsPath/home-selected.svg"),
              icon: SvgPicture.asset("$iconsPath/home.svg"),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("$iconsPath/favorite.svg"),
              activeIcon: SvgPicture.asset("$iconsPath/favorite-selected.svg"),
              label: "Favorites",
            ),
            const BottomNavigationBarItem(
              icon: SizedBox(),
              activeIcon: SizedBox(),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("$iconsPath/notification.svg"),
              activeIcon:
                  SvgPicture.asset("$iconsPath/notification-selected.svg"),
              label: "Notifications",
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("$iconsPath/profile.svg"),
              activeIcon: SvgPicture.asset("$iconsPath/profile-selected.svg"),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
