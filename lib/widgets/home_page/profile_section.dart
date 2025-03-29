import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
              onPressed: () {
                context.go('/');
              },
              child: Text(
                'Menu',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 25,
                ),
              )),
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(
              'assets/img/profile.jpeg',
            ),
          ),
        ],
      ),
    );
  }
}
