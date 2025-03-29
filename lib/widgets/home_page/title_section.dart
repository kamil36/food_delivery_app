import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  final String title;
  const TitleSection({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
            fontFamily: 'Poppins',
            color: Color(0xff101010),
          ),
        ),
      ),
    );
  }
}
