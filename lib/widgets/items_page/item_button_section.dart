import 'package:flutter/material.dart';

class ItemButtonSection extends StatelessWidget {
  const ItemButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50),
      child: InkWell(
        onTap: () {},
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
