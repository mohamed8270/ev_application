// ignore_for_file: prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:ev_application/constants/theme.dart';
import 'package:ev_application/interface/app_bar.dart';
import 'package:ev_application/user_types/admin/components/admin_post_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBarWidget(
          leading: 'https://www.svgrepo.com/show/491107/power.svg',
          title: "Caroxi",
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: InkWell(
                onTap: () => Get.toNamed('adminpostdetailpage'),
                child: SvgPicture.network(
                  'https://www.svgrepo.com/show/524051/gas-station.svg',
                  height: 26,
                  width: 26,
                  color: egreen,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: CircleAvatar(
                backgroundColor: egrey.withOpacity(0.4),
                radius: 18,
                child: SvgPicture.network(
                  'https://www.svgrepo.com/show/422291/profile-user.svg',
                  height: 20,
                  width: 20,
                ),
              ),
            ),
          ],
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
                'Greetings, Mohamed',
                style: ThemeClass.heading11,
              ),
              ThemeClass.space0,
              Text(
                'Reach the electric station at time without any rush',
                style: ThemeClass.heading10,
              ),
              ThemeClass.space2,
              const AdminPostButton(),
              ThemeClass.space2,
              Text(
                "Requested EV's",
                style: ThemeClass.heading2,
              ),
              ThemeClass.space1,
            ],
          ),
        ),
      ),
    );
  }
}
