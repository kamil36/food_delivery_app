import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/add_to_cart_page/first_container_section';
import 'package:food_delivery_app/widgets/add_to_cart_page/second_container_section.dart';

class AddtoCartPage extends StatefulWidget {
  const AddtoCartPage({super.key});

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
            FirstContainerSection(),
            SecondContainerSection(),
          ],
        ),
      ),
    );
  }
}
