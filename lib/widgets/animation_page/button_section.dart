import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.go('/home');
      },
      child: Text(
        "Get Started",
        style: TextStyle(
          fontFamily: 'Poppins',
          color: Color(0xff462B9C),
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
    );
  }
}
