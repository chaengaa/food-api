// ignore_for_file: use_build_context_synchronously, sized_box_for_whitespace, override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:foods_app/controller/logincon.dart';
import 'package:foods_app/view/nav_bar.dart';
import 'package:foods_app/view/register.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  Savelogin savelogin = Savelogin();
  bool? loged;
  @override
  void checkedlogin() async {
    final status = await savelogin.logined();
    setState(() {
      loged = status;
    });
  }

  @override
  void initState() {
    super.initState();
    checkedlogin();
    Future.delayed(Duration(seconds: 11), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => (loged == true) ? NavBars() : Register(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,

        child: Center(
          child: Image.asset(
            "assets/image/d.gif",
            // width: 500,
            // height: 500,
            // "https://i.pinimg.com/originals/54/b9/e6/54b9e65e0f60a16aa007b94855241850.gif",
          ),
        ),
      ),
    );
  }
}
