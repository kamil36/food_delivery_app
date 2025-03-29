import 'package:flutter/material.dart';

class StringSection extends StatelessWidget {
  const StringSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "2 Items in cart",
      style: TextStyle(
        fontFamily: 'Poppins',
        color: Color(0xff000000),
        fontWeight: FontWeight.w400,
        fontSize: 24,
      ),
    );
  }
}
