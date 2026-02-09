// ignore_for_file: unnecessary_string_interpolations, avoid_print, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foods_app/controller/logincon.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';
import 'package:foods_app/view/tapscreen/home_screen.dart';

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
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: emails,
        password: passwords,
      );

      await savelogin.login();
      await Savelogin.saveUserInfo(
        userCredential.user?.displayName ?? 'User',
        emails,
        userCredential.user?.photoURL,
      );

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (route) => false,
      );
    } catch (e) {
      print("${e.toString()}");
    }
  }
  // static void signUp(
  //   BuildContext context,
  //   String emails,
  //   String passwords,
  // ) async {
  //   try {
  //     await auth.createUserWithEmailAndPassword(
  //       email: emails,
  //       password: passwords,
  //     );
  //     await savelogin.login();

  //      await Savelogin.saveUserInfo(
  //     auth.user?.displayName ?? 'User',
  //     emails,
  //     userCredential.user?.photoURL,
  //   );

  //     Navigator.pushAndRemoveUntil(
  //       context,
  //       MaterialPageRoute(builder: (context) => HomeScreen()),
  //       (route) => false,
  //     );
  //   } catch (e) {
  //     print("${e.toString()}");
  //   }
  // }

static void singnIn(
  BuildContext context,
  String emails,
  String passwords,
) async {
  try {
    UserCredential userCredential = await auth.signInWithEmailAndPassword(
      email: emails,
      password: passwords,
    );
    
    await savelogin.login();
    
    //  Save user 
    await Savelogin.saveUserInfo(
      userCredential.user?.displayName ?? 'User',
      emails,
      userCredential.user?.photoURL,
    );
    
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
      (route) => false,
    );
  } catch (e) {
    print("${e.toString()}");
  }
}
  // static void singnIn(
  //   BuildContext context,
  //   String emails,
  //   String passwords,
  // ) async {
  //   try {
  //     await auth.signInWithEmailAndPassword(email: emails, password: passwords);
  //     await savelogin.login();

  //     Navigator.pushAndRemoveUntil(
  //       context,
  //       MaterialPageRoute(builder: (context) => HomeScreen()),
  //       (route) => false,
  //     );
  //   } catch (e) {
  //     print("${e.toString()}");
  //   }
  // }

  GoogleSignIn googleSignIn = GoogleSignIn();
  void singinwithgoogle(BuildContext context) async {
    //google chooser or choose email
    try {
      GoogleSignInAccount? useracc = await googleSignIn.signIn();
      if (useracc == null) {
        Get.snackbar("Cancel", "User canel");
        return;
      }
      GoogleSignInAuthentication userAuth = await useracc.authentication;
      final crediential = GoogleAuthProvider.credential(
        idToken: userAuth.idToken, //identify user
        accessToken: userAuth.accessToken, //add user
      );
      await auth.signInWithCredential(crediential);
      await savelogin.login();

      await Savelogin.saveUserInfo(
        useracc.displayName ?? 'User',
        useracc.email,
        useracc.photoUrl,
      );
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
        (route) => false,
      );
      Get.snackbar("Google", "Success");
    } catch (e) {
      Get.snackbar("Google", "Failed ${e.toString()}");
    }
  }
}
