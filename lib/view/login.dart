// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:foods_app/controller/logincon.dart';
import 'package:foods_app/service/auth_service.dart';
import 'package:foods_app/view/register.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

class Login extends StatelessWidget {
  Login({super.key});
  TextEditingController emailcon = TextEditingController();
  TextEditingController passcon = TextEditingController();
  Savelogin savelogin = Savelogin();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Lottie.asset("assets/image/log.json"),
          Text(
            "Welcome Back",
            style: GoogleFonts.dmSans(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Login into your account",
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
              controller: passcon,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                hintText: "Enter password",
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
              if (emailcon.text.isEmpty || passcon.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Email and password are required"),
                  ),
                );
                return;
              } else {
                AuthServices.singnIn(
                  context,
                  emailcon.text.trim(),
                  passcon.text.trim(),
                );
              }
            },

            child: Text(
              "Login",
              style: GoogleFonts.dmSans(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 15),
          Text(
            "Forgot Password?",
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
                onTap: () {},
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
                "Don't have an account?",
                style: GoogleFonts.dmSans(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(width: 5),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    PageTransition(
                      type: PageTransitionType.bottomToTop,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      child: Register(),
                    ),
                  );
                },
                child: Text(
                  "Sign Up",
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
