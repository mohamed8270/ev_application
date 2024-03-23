// ignore_for_file: deprecated_member_use, prefer_const_literals_to_create_immutables

import 'package:ev_application/constants/theme.dart';
import 'package:ev_application/interface/app_bar.dart';
import 'package:flutter/material.dart';

class UserHomePage extends StatelessWidget {
  const UserHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBarWidget(
          leading: 'https://www.svgrepo.com/show/491107/power.svg',
          title: "Caroxi",
          actions: [],
          click: () {},
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: ThemeClass.padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Greetings',
                style: ThemeClass.heading1,
              ),
              ThemeClass.space0,
              Text(
                'Reach the electric station at time without any rush',
                style: ThemeClass.heading5,
              ),
              ThemeClass.space2,
            ],
          ),
        ),
      ),
    );
  }
}
