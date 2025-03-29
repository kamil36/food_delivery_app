import 'package:flutter/material.dart';

class TextSection extends StatelessWidget {
  final String text;
  const TextSection({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Poppins',
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
    );
  }
}
