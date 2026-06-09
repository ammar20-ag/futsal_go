import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'profile_screen.dart';

class MainNavigationScreen
    extends StatefulWidget {

  const MainNavigationScreen({
    super.key,
  });

  @override
  State<MainNavigationScreen>
      createState() =>
          _MainNavigationScreenState();
}

class _MainNavigationScreenState
    extends State<MainNavigationScreen> {

  int currentIndex = 0;

  final List<Widget> pages = [
    const HomeScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: pages[currentIndex],

      bottomNavigationBar:
          BottomNavigationBar(
        currentIndex: currentIndex,

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}