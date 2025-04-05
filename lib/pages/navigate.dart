// import 'package:flutter/material.dart';
// import 'package:food_delivery_app/pages/home_page.dart';
// import 'package:food_delivery_app/pages/items_page.dart';
// import 'package:food_delivery_app/pages/sample.dart';
// import 'package:food_delivery_app/widgets/home_page/grid_view_section.dart';
// import 'package:food_delivery_app/widgets/home_page/list_view_section.dart';
// import 'package:food_delivery_app/widgets/home_page/profile_section.dart';

// class BottomNavigationBarSection extends StatefulWidget {
//   const BottomNavigationBarSection({super.key});

//   @override
//   State<BottomNavigationBarSection> createState() =>
//       _BottomNavigationBarSectionState();
// }

// class _BottomNavigationBarSectionState
//     extends State<BottomNavigationBarSection> {
//   int _selectedIndex = 0;

//   final List<Widget> _pages = [
//     ProfileSection(),
//     ItemPage(),
//     GridViewSection(),
//     Sample2(),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _pages[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//         backgroundColor: Colors.white,
//         selectedItemColor: const Color(0xff462B9C),
//         unselectedItemColor: const Color(0xff000000),
//         items: [
//           BottomNavigationBarItem(
//               icon:
//                   Icon(_selectedIndex == 0 ? Icons.home : Icons.home_outlined),
//               label: "Home"),
//           BottomNavigationBarItem(
//               icon: Icon(
//                   _selectedIndex == 1 ? Icons.search_outlined : Icons.search),
//               label: "Search"),
//           BottomNavigationBarItem(
//               icon: Icon(_selectedIndex == 2
//                   ? Icons.shopping_cart_rounded
//                   : Icons.shopping_cart_outlined),
//               label: "Cart"),
//           BottomNavigationBarItem(
//               icon: Icon(
//                   _selectedIndex == 3 ? Icons.person : Icons.person_2_outlined),
//               label: "Profile"),
//         ],
//       ),
//     );
//   }
// }
