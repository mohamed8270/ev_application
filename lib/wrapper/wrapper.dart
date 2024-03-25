import 'package:ev_application/constants/theme.dart';
import 'package:ev_application/interface/admin_bottom_nav_bar.dart';
import 'package:ev_application/interface/user_bottom_nav_bar.dart';
import 'package:ev_application/service/auth/front_end/auth_page.dart';
import 'package:ev_application/user_types/admin/pages/admin_home_page.dart';
import 'package:ev_application/user_types/admin/pages/admin_post_detail_page.dart';
import 'package:ev_application/user_types/admin/pages/admin_post_page.dart';
import 'package:ev_application/user_types/admin/pages/admin_profile_page.dart';
import 'package:ev_application/user_types/users/pages/user_home_page.dart';
import 'package:ev_application/user_types/users/pages/user_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Electro Boom',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: egreen),
        useMaterial3: true,
      ),
      routes: {
        'userhomepage': (c) => const UserHomePage(),
        'userprofilepage': (c) => const UserProfilePage(),
        'userbottomnavbar': (c) => const UserBottomNavBar(),
        'adminbottomnavabar': (c) => const AdminBottomNavBar(),
        'adminhomepage': (c) => const AdminHomePage(),
        'adminprofilepage': (c) => const AdminProfilePage(),
        'adminpostpage': (c) => const AdminPostPage(),
        'adminpostdetailpage': (c) => AdminPostDetailPage(),
        'loginpage': (c) => LogInPage(),
      },
      home: LogInPage(),
    );
  }
}
