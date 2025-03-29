import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/product_model.dart';
import 'package:food_delivery_app/widgets/add_to_cart_page/first_container_section.dart';
import 'package:food_delivery_app/widgets/add_to_cart_page/second_container_section.dart';

class AddtoCartPage extends StatefulWidget {
  final Product product;
  const AddtoCartPage({super.key, required this.product});

  @override
  State<AddtoCartPage> createState() => _AddtoCartPageState();
}

final List<Map<String, String>> products = [];

class _AddtoCartPageState extends State<AddtoCartPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            FirstContainerSection(image: widget.product.image),
            SecondContainerSection(product: widget.product),
          ],
        ),
      ),
    );
  }
}
