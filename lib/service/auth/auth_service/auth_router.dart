// ignore_for_file: avoid_print

import 'package:ev_application/constants/theme.dart';
import 'package:ev_application/interface/admin_bottom_nav_bar.dart';
import 'package:ev_application/interface/user_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRouter extends StatefulWidget {
  final User user;
  final String authuserid;
  const AuthRouter({super.key, required this.user, required this.authuserid});

  @override
  State<AuthRouter> createState() => _AuthRouterState();
}

class _AuthRouterState extends State<AuthRouter> {
  late final SupabaseClient supabaseClient;
  Map<String, dynamic>? userData;

  @override
  void initState() {
    super.initState();
    print('User ID: ${widget.user.id}');
    supabaseClient = Supabase.instance.client;
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      final userData_ = await supabaseClient
          .from('users')
          .select()
          .eq('auth_user_id', widget.authuserid)
          .single();
      print('userdata: $userData_');
      setState(() {
        userData = userData_;
      });
    } catch (e) {
      print(e);
      ThemeClass().errorSnack(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (userData == null) {
      print('Loading');
      return const SafeArea(
        child: Center(
          child: SizedBox(
            height: 58,
            width: 58,
            child: CircularProgressIndicator(
              strokeAlign: BorderSide.strokeAlignCenter,
              strokeCap: StrokeCap.round,
              color: egreen,
              strokeWidth: 5,
            ),
          ),
        ),
      );
    }
    final userMetaData = userData!['raw_user_meta_data'];
    // final userType = userMetaData;

    if (userMetaData == 'car_user') {
      return const UserBottomNavBar();
    } else if (userMetaData == 'station_holder') {
      return const AdminBottomNavBar();
    } else {
      print('Error in user athentication');
      return const Text('Error in user athentication');
    }
  }
}
