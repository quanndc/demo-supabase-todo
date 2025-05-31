import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  final count = 0.obs;

  Future<void> loginWithGoogle() async {
    try{
      final GoogleSignIn googleSignIn = GoogleSignIn(
        clientId: "867852799588-0oas99gileabe9rr124fj1h555lgau2o.apps.googleusercontent.com",
        serverClientId: "867852799588-96jgclrdepldmoattcf5uangl5l3cr7c.apps.googleusercontent.com",
      );
      final googleSignInAccount = await googleSignIn.signIn();
      final googleAuth = await googleSignInAccount!.authentication;
      final accessToken = googleAuth.accessToken;
      final idToken = googleAuth.idToken;
      if(accessToken == null){
        throw("Access token is null");
      }
      if(idToken == null){
        throw("Id token is null");
      }
      final supabase = Supabase.instance.client;
      await supabase.auth.signInWithIdToken(
          provider: OAuthProvider.google,
          idToken: idToken,
          accessToken: accessToken
      );

      Get.offAllNamed(Routes.LAYOUT);
      Get.snackbar("Success", "Login with google success");
      
    }
    catch(e){
      if(kDebugMode){
        print("===============================");
        print('Error login with google: $e');
      }
    }
  }


  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
