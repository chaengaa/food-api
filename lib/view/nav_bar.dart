
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foods_app/bloc/bottomnav_bloc.dart';
import 'package:foods_app/tapscreen/home.dart';
import 'package:foods_app/tapscreen/notification.dart';
import 'package:foods_app/tapscreen/profile.dart';
import 'package:foods_app/tapscreen/search.dart';

class NavBars extends StatefulWidget {
  const NavBars({super.key});

  @override
  State<NavBars> createState() => _NavBarsState();
}

class _NavBarsState extends State<NavBars> {
  List<Widget> screen = [Homes(), Searchs(), Profile(), Notifications()];
  bool isSwitch = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBloc, BottomNavState>(
      builder: (context, state) {
        return Scaffold(
          body: screen[state.index],

          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.index,
            onTap: (value) {
              context.read<BottomNavBloc>().add(SelectedNav(index: value));
            },
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: "Search",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: "Notification",
              ),
            ],
          ),
        );
      },
    );
  }
}
