// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:foods_app/controller/logincon.dart';
import 'package:foods_app/data/notifier.dart';
import 'package:foods_app/view/register.dart';

class Homes extends StatefulWidget {
  const Homes({super.key});

  @override
  State<Homes> createState() => _HomesState();
}

class _HomesState extends State<Homes> {
  bool isSwitch = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_bag_outlined),
            // icon: ValueListenableBuilder(
            //   valueListenable: darkmode,
            //   builder: (context, themes, child) {
            //     return Icon(themes ? Icons.dark_mode : Icons.light_mode);
            //   },
            // ),
          ),
        ],
      ),

      //
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Icon(Icons.person),
                ),
              ),
              currentAccountPictureSize: Size(70, 70),
              // decoration: BoxDecoration(color: Colors.white),
              accountName: Text(
                "User",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
              accountEmail: Text(
                "+855 123 456 789",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
            ),

            ListTile(
              leading: Icon(Icons.home),
              title: Text(
                "Home",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              onTap: () {
                Navigator.pop(context); // close drawer
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.person),
              title: Text(
                "Profile",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                "Settings",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.dark_mode_outlined),
              title: Text(
                "Night mode",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              trailing: Switch(
                value: isSwitch,
                onChanged: (value) {
                  setState(() {
                    isSwitch = value;
                    darkmode.value = !darkmode.value;
                  });
                },
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text(
                "Logout",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              onTap: () {
                Savelogin.logout();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Register()),
                );
              },
            ),
          ],
        ),
      ),
      body: Text("Hello"),
    );
  }
}
