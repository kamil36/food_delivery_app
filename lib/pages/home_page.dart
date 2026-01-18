import 'package:flutter/material.dart';
import 'package:food_delivery_app/API/api%20services/api_services.dart';
import 'package:food_delivery_app/API/products%20models/api_model.dart';
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
    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const ProfileSection(),
              const SizedBox(height: 10),
              const SearchFieldSection(),
              const SizedBox(height: 20),
              isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ListViewSection(
                      onTileTapped: _onTileTapped,
                      selectedTileIndex: _selectedTileIndex,
                      products: products,
                    ),
              const TitleSection(title: "Promotions"),
              const SizedBox(height: 5),
              const PromotionCardSection(),
              const SizedBox(height: 20),
              const TitleSection(title: "Popular"),
              isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : GridViewSection(
                      products: products,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
