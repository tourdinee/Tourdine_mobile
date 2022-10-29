import 'package:flutter/material.dart';

import 'home_screen/home_screen.dart';

class HomeBottomNavBar extends StatefulWidget {
  const HomeBottomNavBar({super.key});

  @override
  State<HomeBottomNavBar> createState() => _HomeBottomNavBarState();
}

class _HomeBottomNavBarState extends State<HomeBottomNavBar> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: const SafeArea(
        child: Home(),
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
        items: const [
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.home,
              color: Color(0xffff0000),
            ),
            icon: Icon(
              Icons.home_outlined,
              color: Color(0xffff0000),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star_outline,
              color: Color(0xffff0000),
            ),
            activeIcon: Icon(
              Icons.star,
              color: Color(0xffff0000),
            ),
            label: "Favorites",
          ),
          BottomNavigationBarItem(
            icon: SizedBox(),
            activeIcon: SizedBox(),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications_outlined,
              color: Color(0xffff0000),
            ),
            activeIcon: Icon(
              Icons.notifications,
              color: Color(0xffff0000),
            ),
            label: "Notifications",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
              color: Color(0xffff0000),
            ),
            activeIcon: Icon(
              Icons.person,
              color: Color(0xffff0000),
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
