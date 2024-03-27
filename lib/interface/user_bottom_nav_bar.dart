// ignore_for_file: deprecated_member_use

import 'package:ev_application/constants/theme.dart';
import 'package:ev_application/user_types/users/pages/user_home_page.dart';
import 'package:ev_application/user_types/users/pages/user_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserBottomNavBar extends StatefulWidget {
  const UserBottomNavBar({super.key});

  @override
  State<UserBottomNavBar> createState() => _UserBottomNavBarState();
}

class _UserBottomNavBarState extends State<UserBottomNavBar> {
  int currentIndex = 0;

  final screens = [
    UserHomePage(),
    const UserProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: eblack.withOpacity(0.3),
              width: 0.15,
            ),
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: ewhite,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          iconSize: 18,
          currentIndex: currentIndex,
          selectedLabelStyle: const TextStyle(
            color: egreen,
            fontSize: 12,
            fontWeight: FontWeight.w600,
            height: 1.5,
          ),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          unselectedItemColor: eblack.withOpacity(0.3),
          selectedItemColor: egreen,
          unselectedLabelStyle: TextStyle(
            color: eblack.withOpacity(0.3),
            fontSize: 12,
            fontWeight: FontWeight.w600,
            height: 1.5,
          ),
          onTap: (index) => setState(() => currentIndex = index),
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.network(
                'https://www.svgrepo.com/show/524643/home-angle-2.svg',
                color: eblack.withOpacity(0.4),
              ),
              activeIcon: SvgPicture.network(
                'https://www.svgrepo.com/show/524643/home-angle-2.svg',
                color: egreen,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.network(
                'https://www.svgrepo.com/show/498298/profile.svg',
                color: eblack.withOpacity(0.4),
              ),
              activeIcon: SvgPicture.network(
                'https://www.svgrepo.com/show/498298/profile.svg',
                color: egreen,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
