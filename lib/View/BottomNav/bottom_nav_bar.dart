import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:ecommerce_application/provider/bottom_nav_bar.provider/bottom_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavProvider>(
      builder: (context, data, child) {
        return Scaffold(
          bottomNavigationBar: AnimatedBottomNavigationBar(
            backgroundColor: Colors.white,
            elevation: 0,
            icons: data.iocns,
            gapLocation: GapLocation.none,
            activeIndex: data.currentIndex,
            activeColor: Colors.orange,
            onTap: (value) {
              data.bottomNav(value);
            },
          ),
          body: data.screen[data.currentIndex],
        );
      },
    );
  }
}
