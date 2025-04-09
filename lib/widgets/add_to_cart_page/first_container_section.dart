import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/product_model.dart';
import 'package:food_delivery_app/routes/router_config.dart';
import 'package:go_router/go_router.dart';

class FirstContainerSection extends StatelessWidget {
  // final String image;
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
            Color(0xff959595B8),
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
            child: Image.asset(
              product.image,
              height: 200,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
