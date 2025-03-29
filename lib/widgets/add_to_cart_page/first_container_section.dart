import 'package:flutter/material.dart';
import 'package:food_delivery_app/routes/router_config.dart';
import 'package:go_router/go_router.dart';

class FirstContainerSection extends StatelessWidget {
  final String image;
  const FirstContainerSection({super.key, required this.image});

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
          IconButton(
              onPressed: () => context.go(MyRoutes.homepage),
              icon: Icon(Icons.arrow_back)),
          SizedBox(
            height: 50,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              image,
              height: 140,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
