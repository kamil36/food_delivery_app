import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/home_page/bottom_navigation_bar.dart';
import 'package:food_delivery_app/widgets/items_page/bottom_text_section.dart';
import 'package:food_delivery_app/widgets/items_page/item_button_section.dart';
import 'package:food_delivery_app/widgets/items_page/item_section.dart';
import 'package:food_delivery_app/widgets/items_page/item_title.dart';
import 'package:food_delivery_app/widgets/items_page/payment_card_section.dart';
import 'package:food_delivery_app/widgets/items_page/string_section.dart';
import 'package:food_delivery_app/widgets/items_page/total_section.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({super.key});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

int _selectedIndex = 0;

class _ItemPageState extends State<ItemPage> {
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                StringSection(),
                SizedBox(
                  height: 20,
                ),
                ItemSection(
                    image: "assets/img/pizza_fries.png",
                    title: "Pizza Fries",
                    price: 32),
                SizedBox(
                  height: 20,
                ),
                ItemSection(
                    image: "assets/img/burger.png",
                    title: "Burger Beef",
                    price: 20),
                SizedBox(
                  height: 20,
                ),
                ItemTitleSection(title: "Payment Method"),
                SizedBox(
                  height: 10,
                ),
                PaymentCardSection(),
                SizedBox(
                  height: 20,
                ),
                TotalSection(),
                SizedBox(
                  height: 20,
                ),
                ItemButtonSection(),
                SizedBox(
                  height: 20,
                ),
                BottomTextSection(),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
