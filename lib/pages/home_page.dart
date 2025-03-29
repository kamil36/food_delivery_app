import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/home_page/bottom_navigation_bar.dart';
import 'package:food_delivery_app/widgets/home_page/grid_view_section.dart';
import 'package:food_delivery_app/widgets/home_page/list_view_section.dart';
import 'package:food_delivery_app/widgets/home_page/profile_section.dart';
import 'package:food_delivery_app/widgets/home_page/promotion_card.dart';
import 'package:food_delivery_app/widgets/home_page/search_field.dart';
import 'package:food_delivery_app/widgets/home_page/title_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final List<Map<String, String>> products = [
  {"image": "assets/img/plate.png", "title": "Veg Plate", "price": "\$60"},
  {"image": "assets/img/burger.png", "title": "Beef Burger", "price": "\$90"},
  {"image": "assets/img/pizza.png", "title": "Pizza", "price": "\$80"},
  {
    "image": "assets/img/pizza_fries.png",
    "title": "Pizza Fries",
    "price": "\$120"
  },
];

final List<Map<String, String>> items = [
  {"image": "assets/img/plate.png", 'title': 'All'},
  {"image": "assets/img/burger.png", 'title': 'Burger'},
  {"image": "assets/img/pizza.png", 'title': 'Pizza'},
  {"image": "assets/img/dessert.png", 'title': 'Dessert'},
];

int _selectedIndex = 0;

int _selectedTileIndex = 0;

class _HomePageState extends State<HomePage> {
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onTileTapped(int index) {
    setState(() {
      _selectedTileIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              ProfileSection(),
              SizedBox(
                height: 10,
              ),
              SearchFieldSection(),
              SizedBox(
                height: 20,
              ),
              ListViewSection(
                  onTileTapped: _onTileTapped,
                  selectedTileIndex: _selectedTileIndex),
              TitleSection(title: "Promotions"),
              SizedBox(
                height: 5,
              ),
              PromotionCardSection(),
              SizedBox(
                height: 20,
              ),
              TitleSection(title: "Popular"),
              GridViewSection(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBarSection(
            selectedIndex: _selectedIndex, onItemTapped: _onItemTapped),
      ),
    );
  }
}
