import 'package:flutter/material.dart';
import 'package:food_delivery_app/API/products%20models/api_model.dart';
import 'package:food_delivery_app/routes/router_config.dart';
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
  final List<Product> products;

  const GridViewSection({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.8,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return InkWell(
            onTap: () {
              final product = products[index];
              context.go(MyRoutes.addtocart, extra: product);
            },
            child: GridTileWidget(
              image: product.thumbnail,
              title: product.title,
              price: "\$${product.price}",
            ),
          );
        },
      ),
    );
  }
}
