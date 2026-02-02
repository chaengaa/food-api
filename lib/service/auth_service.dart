// ignore_for_file: unnecessary_string_interpolations, avoid_print, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foods_app/controller/logincon.dart';
import 'package:foods_app/view/nav_bar.dart';

class AuthServices {
  static FirebaseAuth auth = FirebaseAuth.instance;

  static Savelogin savelogin = Savelogin();
  //sign up (register)
  static void signUp(
    BuildContext context,
    String emails,
    String passwords,
  ) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: emails,
        password: passwords,
      );
      await savelogin.login();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => NavBars()),
        (route) => false,
      );
    } catch (e) {
      print("${e.toString()}");
    }
  }

  static void singnIn(
    BuildContext context,
    String emails,
    String passwords,
  ) async {
    try {
      await auth.signInWithEmailAndPassword(email: emails, password: passwords);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => NavBars()),
        (route) => false,
      );
    } catch (e) {
      print("${e.toString()}");
    }
  }

  // GoogleSignIn googleSignIn = GoogleSignIn();
  // void singinwithgoogle() async {
  //   //google chooser or choose email
  //   try {
  //     GoogleSignInAccount? useracc = await googleSignIn.signIn();
  //     if (useracc == null) {
  //       Get.snackbar("Cancel", "User canel");
  //       return;
  //     }
  //     GoogleSignInAuthentication userAuth = await useracc.authentication;
  //     final crediential = GoogleAuthProvider.credential(
  //       idToken: userAuth.idToken, //identify user
  //       accessToken: userAuth.accessToken, //add user
  //     );
  //     await auth.signInWithCredential(crediential);
  //     await savelogin.login();
  //     Get.offAll(NavBars());
  //     Get.snackbar("Google", "Success");
  //   } catch (e) {
  //     Get.snackbar("Google", "Failed ${e.toString()}");
  //   }
  // }
}
