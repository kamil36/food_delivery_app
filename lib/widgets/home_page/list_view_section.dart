import 'package:flutter/material.dart';
import 'package:food_delivery_app/API/products%20models/api_model.dart';
import 'package:food_delivery_app/models/product_model.dart' hide Product;

class ListViewSection extends StatelessWidget {
  final List<Product> products;
  final Function(int) onTileTapped;
  final int selectedTileIndex;

  const ListViewSection({
    super.key,
    required this.products,
    required this.onTileTapped,
    required this.selectedTileIndex,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];

          return InkWell(
            onTap: () => onTileTapped(index),
            child: Column(
              children: [
                Container(
                  height: 70,
                  width: 70,
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: selectedTileIndex == index
                        ? const Color(0xff462B9C)
                        : const Color(0xffEBE8E8),
                  ),
                  child: Image.network(product.thumbnail, fit: BoxFit.cover),
                ),
                const SizedBox(height: 4),
                SizedBox(
                  width: 70,
                  child: Text(
                    product.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      color: selectedTileIndex == index
                          ? const Color(0xff462B9C)
                          : const Color(0xff868585),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
