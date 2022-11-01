import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tourdine/constants/constants.dart';
import 'package:tourdine/features/home/favorite_screen/favorite_screen.dart';
import 'package:tourdine/features/home/profile_screen/profile_screen.dart';

import 'home_screen/home_screen.dart';

class HomeBottomNavBar extends StatefulWidget {
  const HomeBottomNavBar({super.key});

  @override
  State<HomeBottomNavBar> createState() => _HomeBottomNavBarState();
}

class _HomeBottomNavBarState extends State<HomeBottomNavBar> {
  List<Widget> screen = [
    const Home(),
    const FavoriteScreen(),
    const SizedBox(),
    const Center(child: Text("Notification")),
    const ProfileScreen()
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: screen[currentIndex],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xffff0000),
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xffff0000),
        onTap: (value) {
          if (value != 2) {
            currentIndex = value;
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
            activeIcon: const Icon(
              Icons.notifications,
              color: Color(0xffff0000),
            ),
            label: "Notifications",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("$iconsPath/profile.svg"),
            activeIcon: SvgPicture.asset("$iconsPath/profile-selected.svg"),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
