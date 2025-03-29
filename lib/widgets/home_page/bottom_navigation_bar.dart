import 'package:flutter/material.dart';

class BottomNavigationBarSection extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavigationBarSection(
      {super.key, required this.selectedIndex, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      backgroundColor: Colors.white,
      selectedItemColor: const Color(0xff462B9C),
      unselectedItemColor: const Color(0xff000000),
      items: [
        BottomNavigationBarItem(
            icon: Icon(selectedIndex == 0 ? Icons.home : Icons.home_outlined),
            label: "Home"),
        BottomNavigationBarItem(
            icon:
                Icon(selectedIndex == 1 ? Icons.search_outlined : Icons.search),
            label: "Search"),
        BottomNavigationBarItem(
            icon: Icon(selectedIndex == 2
                ? Icons.shopping_cart_rounded
                : Icons.shopping_cart_outlined),
            label: "Cart"),
        BottomNavigationBarItem(
            icon: Icon(
                selectedIndex == 3 ? Icons.person : Icons.person_2_outlined),
            label: "Profile"),
      ],
    );
  }
}
