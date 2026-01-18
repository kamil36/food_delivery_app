import 'package:flutter/material.dart';

class StringSection extends StatelessWidget {
  final int itemCount;

  const StringSection({super.key, this.itemCount = 0});

  @override
  Widget build(BuildContext context) {
    return Text(
      '$itemCount Item${itemCount != 1 ? 's' : ''} in cart',
      style: const TextStyle(
        fontFamily: 'Poppins',
        color: Color(0xff000000),
        fontWeight: FontWeight.w600,
        fontSize: 24,
      ),
    );
  }
}
