import 'package:flutter/material.dart';
import 'grid_tile.dart';
import 'package:go_router/go_router.dart';

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

class GridViewSection extends StatelessWidget {
  const GridViewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.9,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              context.go('/add');
            },
            child: GridTileWidget(
              image: products[index]["image"]!,
              title: products[index]["title"]!,
              price: products[index]["price"]!,
            ),
          );
        },
      ),
    );
  }
}
