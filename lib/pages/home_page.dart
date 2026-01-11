import 'package:flutter/material.dart';
import 'package:food_delivery_app/API/api%20services/api_services.dart';
import 'package:food_delivery_app/API/products%20models/api_model.dart';
import 'package:food_delivery_app/models/product_model.dart' hide Product;
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
List<Product> products = [];
bool isLoading = true;

class _HomePageState extends State<HomePage> {
  void _onTileTapped(int index) {
    setState(() {
      _selectedTileIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    loadProducts();
  }

  void loadProducts() async {
    products = await ApiService().fetchProducts();
    setState(() {
      isLoading = false;
    });
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              ProfileSection(),
              SizedBox(
                height: 10,
              ),
              SearchFieldSection(),
              SizedBox(
                height: 20,
              ),
              isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ListViewSection(
                      onTileTapped: _onTileTapped,
                      selectedTileIndex: _selectedTileIndex,
                      products: products,
                    ),
              TitleSection(title: "Promotions"),
              SizedBox(
                height: 5,
              ),
              PromotionCardSection(),
              SizedBox(
                height: 20,
              ),
              TitleSection(title: "Popular"),
              isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : GridViewSection(
                      products: products, // 👈 PASS LIST HERE
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
