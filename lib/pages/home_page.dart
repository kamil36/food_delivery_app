import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/product_model.dart';
import 'package:food_delivery_app/pages/animation_page.dart';
import 'package:food_delivery_app/pages/items_page.dart';
import 'package:food_delivery_app/pages/navigate.dart';
import 'package:food_delivery_app/pages/profile.dart';
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

int _selectedTileIndex = 0;

class _HomePageState extends State<HomePage> {
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
      ),
    );
  }
}
