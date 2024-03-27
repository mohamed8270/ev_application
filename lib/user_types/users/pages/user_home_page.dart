// ignore_for_file: deprecated_member_use, prefer_const_literals_to_create_immutables

import 'package:ev_application/constants/theme.dart';
import 'package:ev_application/interface/app_bar.dart';
import 'package:ev_application/user_types/users/components/station_post_repo.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserHomePage extends StatelessWidget {
  UserHomePage({super.key});

  final supabase = Supabase.instance.client;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final user = supabase.auth.currentUser;
    final userName = user!.userMetadata?['full_name'];
    final profileImageUrl = user.userMetadata?['avatar_url'];
    // final profileMail = user.userMetadata?['email'];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBarWidget(
          leading: 'https://www.svgrepo.com/show/491107/power.svg',
          title: "Caroxi",
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: CircleAvatar(
                backgroundColor: egrey.withOpacity(0.4),
                radius: 18,
                child: ClipOval(
                  child: Image.network(
                    profileImageUrl == null
                        ? 'https://static.vecteezy.com/system/resources/thumbnails/005/544/718/small/profile-icon-design-free-vector.jpg'
                        : profileImageUrl.toString(),
                    height: 34,
                    width: 34,
                    fit: BoxFit.cover,
                  ),
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
                'Greetings, $userName',
                style: ThemeClass.heading1,
              ),
              ThemeClass.space0,
              Text(
                'Reach the electric station at time without any rush',
                style: ThemeClass.heading10,
              ),
              ThemeClass.space2,
              Text(
                'Staions near you',
                style: ThemeClass.heading2,
              ),
              ThemeClass.space0,
              SizedBox(
                height: screenSize.height,
                width: screenSize.width * 0.95,
                child: UserStationDetails(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
