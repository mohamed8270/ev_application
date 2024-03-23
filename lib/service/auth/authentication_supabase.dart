// ignore_for_file: avoid_print

import 'package:ev_application/constants/theme.dart';
import 'package:ev_application/database/supabase_data.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GoogleAuthentication extends GetxController {
  final supabaseHelper = Get.find<SupaBaseHelper>();
  final googleSignin = GoogleSignIn();

  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? account = await googleSignin.signIn();
      if (account != null) {
        final GoogleSignInAuthentication auth = await account.authentication;
        final idToken = auth.idToken;
        final response = await Supabase.instance.client.auth.signInWithIdToken(
          provider: OAuthProvider.google,
          idToken: idToken.toString(),
        );
        response.user?.userMetadata;
        if (response.user != null) {
          return response.user;
        } else {
          print('Cant signin');
          return null;
        }
      } else {
        print('Supabase doesnt work');
        return null;
      }
    } catch (e) {
      ThemeClass().googleSnack(e);
      return null;
    }
  }
}
