// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:foods_app/service/auth_service.dart';
import 'package:foods_app/view/login.dart';

// import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

class Register extends StatelessWidget {
  Register({super.key});
  TextEditingController emailcon = TextEditingController();
  TextEditingController passwordcon = TextEditingController();
  TextEditingController confirmpasswordcon = TextEditingController();
  // AuthServices authServices = Get.put(AuthServices());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 20),
          Lottie.asset("assets/image/register.json", width: 280, height: 280),
          Text(
            "Welcome",
            style: GoogleFonts.dmSans(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "create your account",
            style: GoogleFonts.dmSans(
              fontSize: 20,
              // fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: emailcon,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: "Enter email",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: passwordcon,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: "Enter password",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: confirmpasswordcon,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: "Confirm password",
              ),
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent.shade700,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              AuthServices.signUp(context, emailcon.text, passwordcon.text);

              emailcon.clear();
              passwordcon.clear();
              confirmpasswordcon.clear();
            },
            child: Text(
              "Sign Up",
              style: GoogleFonts.dmSans(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 15),
          Text(
            "Or",
            style: GoogleFonts.dmSans(
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.facebook,
                  color: Colors.blueAccent.shade700,
                  size: 35,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // authServices.singinwithgoogle();
                },
                child: Image.asset(
                  "assets/image/google.png",
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 10),
              Image.network(
                "https://www.sendible.com/hubfs/blog-import/2020/20-08-Aug/sm-icons-linkedin-in-logo.png",
                width: 30,
                height: 30,
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Have an account?",
                style: GoogleFonts.dmSans(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(width: 5),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.topToBottom,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      child: Login(),
                    ),
                  );
                },
                child: Text(
                  "Login",
                  style: GoogleFonts.dmSans(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.blueAccent.shade700,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
