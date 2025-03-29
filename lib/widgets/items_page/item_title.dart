import 'package:flutter/material.dart';

class ItemTitleSection extends StatelessWidget {
  final String title;
  const ItemTitleSection({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w500,
        fontFamily: 'Poppins',
        color: Color(0xff101010),
      ),
    );
  }
}
