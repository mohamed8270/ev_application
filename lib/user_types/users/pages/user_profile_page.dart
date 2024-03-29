import 'package:ev_application/constants/theme.dart';
import 'package:ev_application/interface/custom_button.dart';
import 'package:ev_application/service/auth/front_end/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserProfilePage extends StatelessWidget {
  UserProfilePage({super.key});
  final supabase = Supabase.instance.client;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final user = supabase.auth.currentUser;
    final profileimage = user?.userMetadata?['avatar_url'];
    final fullname = user?.userMetadata?['full_name'];
    final email = user?.userMetadata?['email'];
    final createdat = user?.userMetadata?['created_at'];
    final updatedat = user?.userMetadata?['updated_at'];
    final confirmedat = user?.userMetadata?['confirmed_at'];
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: eblack.withOpacity(0.03),
              child: ClipOval(
                child: Image.network(
                  profileimage,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ThemeClass.space2,
            Text(
              fullname.toString(),
              style: ThemeClass.heading1,
            ),
            ThemeClass.space1,
            Text(
              email.toString(),
              style: ThemeClass.heading5,
            ),
            ThemeClass.space1,
            Text(
              createdat.toString(),
              style: ThemeClass.heading5,
            ),
            ThemeClass.space1,
            Text(
              updatedat.toString(),
              style: ThemeClass.heading5,
            ),
            ThemeClass.space1,
            Text(
              confirmedat.toString(),
              style: ThemeClass.heading5,
            ),
            ThemeClass.space2,
            CustomButtonWidget(
              height: screenSize.height * 0.04,
              width: screenSize.width * 0.2,
              radius: 10,
              color: egreen,
              txt: 'Signout',
              click: () async {
                await supabase.auth.signOut();
                if (context.mounted) {
                  Get.to(const LogInPage());
                }
              },
              txtsize: 12,
              txtcolor: ewhite,
            ),
          ],
        ),
      ),
    );
  }
}
