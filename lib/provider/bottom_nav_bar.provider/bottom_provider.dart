import 'package:ecommerce_application/View/bottom_screens/cart_screen.dart';
import 'package:ecommerce_application/View/bottom_screens/profile_screen.dart';
import 'package:ecommerce_application/View/bottom_screens/search_screen.dart';
import 'package:ecommerce_application/View/homeScreens/homescreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavProvider extends ChangeNotifier {
  int currentIndex = 0;

  List<Widget> screen = [
    const HomeScreen(),
    const SearchScreen(),
    const CartScreen(),
    const ProfileScreen()
  ];
  List<IconData> iocns = [
    FontAwesomeIcons.house,
    FontAwesomeIcons.searchengin,
    FontAwesomeIcons.cartArrowDown,
    FontAwesomeIcons.peopleRobbery,
  ];
  void bottomNav(int value) {
    currentIndex = value;
    notifyListeners();
  }
}
