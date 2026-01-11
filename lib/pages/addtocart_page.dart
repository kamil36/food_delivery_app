import 'package:flutter/material.dart';
import 'package:food_delivery_app/API/products%20models/api_model.dart';
import 'package:food_delivery_app/models/product_model.dart';
import 'package:food_delivery_app/pages/home_page.dart';
import 'package:food_delivery_app/widgets/add_to_cart_page/first_container_section.dart';
import 'package:food_delivery_app/widgets/add_to_cart_page/second_container_section.dart';

class AddtoCartPage extends StatefulWidget {
  final Product product;

  const AddtoCartPage({super.key, required this.product});

  @override
  State<AddtoCartPage> createState() => _AddtoCartPageState();  
}

class _AddtoCartPageState extends State<AddtoCartPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            FirstContainerSection(product: widget.product),
            SecondContainerSection(product: widget.product),
          ],
        ),
      ),
    );
  }
}
