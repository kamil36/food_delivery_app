import 'package:flutter/material.dart';

class BottomTextSection extends StatelessWidget {
  const BottomTextSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Back to Menu",
        style: TextStyle(
          fontFamily: 'Poppins',
          color: Color(0xff303030),
          fontWeight: FontWeight.w400,
          fontSize: 18,
        ),
      ),
    );
  }
}
