import 'package:flutter/material.dart';
import 'package:it_support/constant.dart';
import 'package:it_support/screens/admin_screen/list_it_support_screen.dart';
import 'package:it_support/screens/admin_screen/list_service_screen.dart';
import 'package:it_support/screens/auth_screen/register_screen_itsupport.dart';
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
    ListService(),
    RegisterScreenIT(),
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
                icon: Icon(Icons.manage_accounts),
                label: "Manage custormer",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.manage_accounts),
                label: "Manage IT support",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.design_services),
                label: "Manage Service",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_circle_outline),
                label: "Tạo IT Support",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Hồ Sơ",
              ),
            ],
          ),
        ),
      );
}
