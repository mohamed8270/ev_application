// ignore_for_file: avoid_print

import 'package:ev_application/constants/theme.dart';
import 'package:ev_application/service/auth/front_end/auth_button.dart';
import 'package:ev_application/service/auth/auth_service/authentication_supabase.dart';
import 'package:ev_application/service/auth/front_end/user_type_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final url =
      'https://static.vecteezy.com/system/resources/previews/023/251/421/original/electric-vehicle-technology-illustration-png.png';

  final GoogleAuthentication googleAuthentication =
      Get.put(GoogleAuthentication());

  late final SupabaseClient supabaseClient;

  @override
  void initState() {
    super.initState();
    supabaseClient = Supabase.instance.client;
  }

  String userType_ = '';

  void userTypeSelect(String userType) {
    setState(() {
      userType_ = userType;
    });
  }

  Future<void> userMetaData(User user, String userType) async {
    try {
      await supabaseClient.from('users').update({
        'raw_user_meta_data': {"user_type": userType}
      }).eq('id', user.id.toString());
    } catch (e) {
      print('Front-end userMetaData');
      print(e);
      ThemeClass().errorSnack(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: eblack,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 10, left: 10, top: 160),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: screenSize.height * 0.4,
                  width: screenSize.width * 0.95,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      image: NetworkImage(
                        url,
                      ),
                      fit: BoxFit.contain,
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                ),
                ThemeClass.space1,
                Text(
                  'Caroxi',
                  style: ThemeClass.loginHeading,
                ),
                ThemeClass.space0,
                Text(
                  'A first ever application for EV car holders and Stations holders',
                  style: ThemeClass.loginParagraph,
                ),
                ThemeClass.space1,
                Row(
                  children: [
                    UserTypeButton(
                      txt: 'Car User',
                      click: (userType) => userTypeSelect('car_user'),
                      selected: userType_ == 'car_user',
                    ),
                    ThemeClass.space5,
                    UserTypeButton(
                      txt: 'Station Holder',
                      click: (userType) => userTypeSelect('station_holder'),
                      selected: userType_ == 'station_holder',
                    ),
                  ],
                ),
                ThemeClass.space1,
                LoginButton(
                  txt: 'Continue with Google',
                  url: 'https://www.svgrepo.com/show/475656/google-color.svg',
                  click: () async {
                    final authResponse =
                        await googleAuthentication.signInWithGoogle();
                    if (authResponse!.session != null) {
                      final user = authResponse.user;
                      await userMetaData(user!, userType_);
                      print(user);
                    } else {
                      print('Sigin cancelled');
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
