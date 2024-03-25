// ignore_for_file: avoid_print
import 'package:ev_application/constants/theme.dart';
import 'package:ev_application/database/supabase_data.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class GoogleAuthentication extends GetxController {
  final supabaseHelper = Get.find<SupaBaseHelper>();

  Future<AuthResponse?> signInWithGoogle() async {
    final supabase = Supabase.instance.client;
    try {
      final webClientId = dotenv.env['WEBCLIENT_ID'].toString();
      final GoogleSignIn googleSignin =
          GoogleSignIn(serverClientId: webClientId);
      final googleUser = await googleSignin.signIn();
      final googleAuth = await googleUser!.authentication;
      final accessToken = googleAuth.accessToken;
      final idToken = googleAuth.idToken;
      if (accessToken == null) {
        print('Access Token not found');
      }
      if (idToken == null) {
        print('IdToken not found');
      }
      final client = supabase.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken.toString(),
        accessToken: accessToken,
      );
      return client;
    } catch (e) {
      ThemeClass().googleSnack(e);
      return null;
    }
  }
}
