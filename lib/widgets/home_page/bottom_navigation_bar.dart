import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/animation_page.dart';
import 'package:food_delivery_app/pages/home_page.dart';
import 'package:food_delivery_app/pages/items_page.dart';
import 'package:food_delivery_app/pages/profile.dart';
import 'package:food_delivery_app/pages/search_page.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

int _selectedIndex = 0;

class _NavigationPageState extends State<NavigationPage> {
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static final List<Widget> _pages = <Widget>[
    HomePage(),
    SearchPage(),
    ItemPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xff462B9C),
        unselectedItemColor: const Color(0xff000000),
        items: [
          BottomNavigationBarItem(
              icon:
                  Icon(_selectedIndex == 0 ? Icons.home : Icons.home_outlined),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                  _selectedIndex == 1 ? Icons.search_outlined : Icons.search),
              label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 2
                  ? Icons.shopping_cart_rounded
                  : Icons.shopping_cart_outlined),
              label: "Cart"),
          BottomNavigationBarItem(
              icon: Icon(
                  _selectedIndex == 3 ? Icons.person : Icons.person_2_outlined),
              label: "Profile"),
        ],
      ),
    );
  }
}
