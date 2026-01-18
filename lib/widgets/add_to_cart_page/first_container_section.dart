// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:food_delivery_app/API/products%20models/api_model.dart';
import 'package:food_delivery_app/routes/router_config.dart';
import 'package:go_router/go_router.dart';

class FirstContainerSection extends StatelessWidget {
  final Product product;
  const FirstContainerSection({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [
            Color(0xff959595b8),
            Color(0xff462B9C),
          ],
          radius: 0.6,
          stops: [
            0.3,
            0.9,
          ],
          tileMode: TileMode.clamp,
          center: Alignment.center,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BackButton(
            color: Colors.white,
            onPressed: () => context.go(MyRoutes.navigate),
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.network(
              product.thumbnail,
              height: 200,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
