import 'package:flutter/material.dart';
import 'package:it_support/constant.dart';
import 'package:it_support/screens/admin_screen/list_it_support_screen.dart';
import 'package:it_support/screens/home_screen.dart';
import 'package:it_support/screens/request_screen/it_support_list_screen.dart';
import 'package:it_support/screens/profile_screen/profile_screen.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;

  final screens = [
    HomeScreenCustomer(),
    ListItScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) => Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: SizedBox(
          height: 45,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: kBackgroundColor,
            selectedItemColor: kBlueColor,
            showUnselectedLabels: false,
            iconSize: 25,
            selectedFontSize: 8,
            currentIndex: currentIndex,
            onTap: (index) => setState(() => currentIndex = index),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.format_list_bulleted),
                label: "List custormer",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.format_list_bulleted),
                label: "List IT support",
              ),
              // BottomNavigationBarItem(
              //   icon: Icon(Icons.message),
              //   label: "Trò truyện",
              // ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Hồ Sơ",
              ),
            ],
          ),
        ),
      );
}
