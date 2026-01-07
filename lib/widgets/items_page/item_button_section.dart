import 'package:flutter/material.dart';
import 'package:food_delivery_app/routes/router_config.dart';
import 'package:go_router/go_router.dart';

class ItemButtonSection extends StatefulWidget {
  final int? index;
  const ItemButtonSection({super.key, this.index});

  @override
  State<ItemButtonSection> createState() => _ItemButtonSectionState();
}

class _ItemButtonSectionState extends State<ItemButtonSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50),
      child: InkWell(
       onTap: () {
  
  context.go(
    MyRoutes.razorpay,
  );
},

        child: Container(
          height: 50,
          width: 230,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(0xff462B9C),
          ),
          child: Center(
            child: Text(
              "Order",
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 27,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
