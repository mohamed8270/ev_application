// ignore_for_file: deprecated_member_use

import 'package:ev_application/constants/theme.dart';
import 'package:ev_application/user_types/admin/pages/admin_home_page.dart';
import 'package:ev_application/user_types/admin/pages/admin_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminBottomNavBar extends StatefulWidget {
  const AdminBottomNavBar({super.key});

  @override
  State<AdminBottomNavBar> createState() => _AdminBottomNavBarState();
}

class _AdminBottomNavBarState extends State<AdminBottomNavBar> {
  int currentIndex = 0;

  final screens = [
    AdminHomePage(),
    AdminProfilePage(),
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
          selectedLabelStyle: GoogleFonts.poppins(
            color: egreen,
            fontSize: 9,
            fontWeight: FontWeight.w600,
            height: 2,
          ),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          unselectedItemColor: eblack.withOpacity(0.3),
          selectedItemColor: egreen,
          unselectedLabelStyle: GoogleFonts.poppins(
            color: eblack.withOpacity(0.3),
            fontSize: 9,
            fontWeight: FontWeight.w600,
            height: 2,
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
