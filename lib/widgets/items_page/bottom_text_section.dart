import 'package:flutter/material.dart';
import 'package:food_delivery_app/routes/router_config.dart';
import 'package:go_router/go_router.dart';

class BottomTextSection extends StatelessWidget {
  const BottomTextSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        child: Text(
          "Back to Menu",
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Color(0xff303030),
            fontWeight: FontWeight.w400,
            fontSize: 18,
          ),
        ),
        onPressed: () {
          context.go(MyRoutes.navigate);
        },
      ),
    );
  }
}
