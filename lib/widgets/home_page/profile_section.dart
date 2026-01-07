import 'package:flutter/material.dart';
import 'package:food_delivery_app/routes/router_config.dart';
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
                if (GoRouterState.of(context).uri.toString() != '/') {
                  context.go('/');
                }
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
          InkWell(
            onTap: () {
              context.push(MyRoutes.profile);
            },
            child: CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(
                'assets/img/profile.jpeg',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
